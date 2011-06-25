/*
**
** Copyright 2007, The Android Open Source Project
**
** Licensed under the Apache License, Version 2.0 (the "License"); 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
**
**     http://www.apache.org/licenses/LICENSE-2.0 
**
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
*/

#define LOG_TAG "AudioHardwareWrapper"
//#define LOG_NDEBUG 0

#include <cutils/properties.h>
#include <string.h>
#include <unistd.h>

#include <utils/Log.h>
#include <utils/String8.h>

#include <media/AudioRecord.h>

#include "AudioHardwareStub.h"
#include "AudioHardwareGeneric.h"
#include "AudioHardwareWrapper.h"

//#define DUMP_FLINGER_OUT        // if defined allows recording samples in a file
#ifdef DUMP_FLINGER_OUT
#include "AudioDumpInterface.h"
#endif


namespace android {

enum audio_routes {
	ROUTE_EARPIECE		= (1 << 0),
	ROUTE_SPEAKER		= (1 << 1),
	ROUTE_BLUETOOTH_SCO	= (1 << 2),
	ROUTE_HEADSET		= (1 << 3),
	ROUTE_BLUETOOTH_A2DP	= (1 << 4),
	ROUTE_ALL		= -1UL,
};

#define DEVICE_EARPIECE	(AudioSystem::DEVICE_OUT_EARPIECE)
#define DEVICE_SPEAKER	(AudioSystem::DEVICE_OUT_SPEAKER)
#define DEVICE_HEADSET	(AudioSystem::DEVICE_OUT_WIRED_HEADSET \
			 | AudioSystem::DEVICE_OUT_WIRED_HEADPHONE)
#define DEVICE_BLUETOOTH_SCO \
			(AudioSystem::DEVICE_OUT_BLUETOOTH_SCO \
			 | AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_HEADSET \
			 | AudioSystem::DEVICE_OUT_BLUETOOTH_SCO_CARKIT)
#define DEVICE_BLUETOOTH_A2DP \
			(AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP \
			 | AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP_HEADPHONES \
			 | AudioSystem::DEVICE_OUT_BLUETOOTH_A2DP_SPEAKER)

static inline uint32_t devicesToRoutes(uint32_t devices)
{
	uint32_t routes = 0;

	if (devices & DEVICE_EARPIECE)
		routes |= ROUTE_EARPIECE;
	if (devices & DEVICE_SPEAKER)
		routes |= ROUTE_SPEAKER;
	if (devices & DEVICE_HEADSET)
		routes |= ROUTE_HEADSET;
	if (devices & DEVICE_BLUETOOTH_SCO)
		routes |= ROUTE_BLUETOOTH_SCO;
	if (devices & DEVICE_BLUETOOTH_A2DP)
		routes |= ROUTE_BLUETOOTH_A2DP;

	return routes;
}

#define DEVICE_VOICE_CALL_INPUT	(AudioSystem::DEVICE_IN_VOICE_CALL)
#define DEVICE_MIC_INPUT	(AudioSystem::DEVICE_IN_BUILTIN_MIC)
#define DEVICE_DEFAULT_INPUT	(AudioSystem::DEVICE_IN_DEFAULT)

static inline int devicesToInput(uint32_t devices)
{
	if (devices & DEVICE_VOICE_CALL_INPUT)
		return VOICE_CALL_INPUT;
	if (devices & DEVICE_MIC_INPUT)
		return MIC_INPUT;
	if (devices & DEVICE_DEFAULT_INPUT)
		return DEFAULT_INPUT;

	return DEFAULT_INPUT;
}

static inline uint32_t channelCountToOutputChannels(uint32_t channelCount)
{
	switch (channelCount)
	{
	case 0:
		return 0;

	case 2:
		return AudioSystem::CHANNEL_OUT_STEREO;
	}

	return AudioSystem::CHANNEL_OUT_MONO;
}

static inline uint32_t outputChannelsToChannelCount(uint32_t channels)
{
	switch (channels)
	{
	case 0:
		return 0;

	case AudioSystem::CHANNEL_OUT_STEREO:
		return 2;
	}

	return 1;
}

static inline uint32_t channelCountToInputChannels(uint32_t channelCount)
{
	switch (channelCount)
	{
	case 0:
		return 0;

	case 2:
		return AudioSystem::CHANNEL_IN_STEREO;
	}

	return AudioSystem::CHANNEL_IN_MONO;
}

static inline uint32_t inputChannelsToChannelCount(uint32_t channels)
{
	switch (channels)
	{
	case 0:
		return 0;

	case AudioSystem::CHANNEL_IN_STEREO:
		return 2;
	}

	return 1;
}

AudioStreamOutWrapper::AudioStreamOutWrapper(AudioHardwareInterface *intf, AudioStreamOut *out, uint32_t devices)
{
	LOGV("new AudioStreamOutWrapper(%p)", out);
	mHardware = intf;
	hw = out;
	mDevices = devices;
}

AudioStreamOutWrapper::~AudioStreamOutWrapper()
{
	LOGV("delete AudioStreamOutWrapper()");
	delete hw;
}

uint32_t AudioStreamOutWrapper::sampleRate() const
{
	uint32_t r = hw->sampleRate();
	LOGV("AudioStreamOutWrapper::sampleRate() = %d", r);
	return r;
}

size_t AudioStreamOutWrapper::bufferSize() const
{
	size_t n = hw->bufferSize();
	LOGV("AudioStreamOutWrapper::bufferSize() = %d", n);
	return n;
}

uint32_t AudioStreamOutWrapper::channels() const
{
	uint32_t c = hw->channelCount();
	LOGV("AudioStreamOutWrapper::channelcount() = %d", c);
	return channelCountToOutputChannels(c);
}

int AudioStreamOutWrapper::format() const
{
	int f = hw->format();
	LOGV("AudioStreamOutWrapper::format() = %d", f);
	return f;
}

uint32_t AudioStreamOutWrapper::latency() const
{
	uint32_t l = hw->latency();
        LOGV("AudioStreamOutWrapper::latency() = %d", l);
	return l;
}

status_t AudioStreamOutWrapper::setVolume(float left, float right)
{
	float volume = (left + right) / 2;
	status_t s = hw->setVolume(volume);
        LOGV("AudioStreamOutWrapper::setVolume(%1.2f, %1.2f) = %d", left, right, s);
	return s;
}

status_t AudioStreamOutWrapper::Open()
{
	status_t s = hw->Open();
	LOGV("AudioStreamOutWrapper::Open() = %d", s);
	return s;
}

ssize_t AudioStreamOutWrapper::write(const void* buffer, size_t bytes)
{
	ssize_t s = hw->write(buffer, bytes);
        LOGV("AudioStreamOutWrapper::write(%p, %d) = %d", buffer, bytes, (int)s);
	return s;
}

status_t AudioStreamOutWrapper::standby()
{
	status_t s = hw->standby();
        LOGV("AudioStreamOutWrapper::standby() = %d", s);
	return s;
}

status_t AudioStreamOutWrapper::dump(int fd, const Vector<String16>& args)
{
	status_t s = hw->dump(fd, args);
        LOGV("AudioStreamOutWrapper::dump(%d, args) = %d", fd, s);
	return s;
}

status_t AudioStreamOutWrapper::setParameters(const String8& keyValuePairs)
{
	AudioParameter param = AudioParameter(keyValuePairs);
	String8 key = String8(AudioParameter::keyRouting);
	status_t status = NO_ERROR;
	int device;

        LOGV("AudioStreamOutWrapper::setParameters(\"%s\")", keyValuePairs.string());

	if (param.getInt(key, device) == NO_ERROR) {
		mDevices = device;
		LOGV("set output routing %x", mDevices);
		uint32_t routes = devicesToRoutes(mDevices);
		status = mHardware->setRouting(AudioSystem::MODE_NORMAL, routes);
		param.remove(key);
	}

	if (param.size()) {
		status = BAD_VALUE;
	}
	return status;
}

String8 AudioStreamOutWrapper::getParameters(const String8& keys)
{
        LOGV("AudioStreamOutWrapper::getParameters(\"%s\")", keys.string());

	AudioParameter param = AudioParameter(keys);
	String8 value;
	String8 key = String8(AudioParameter::keyRouting);

	if (param.get(key, value) == NO_ERROR) {
		LOGV("get routing %x", mDevices);
		param.addInt(key, (int)mDevices);
	}

	LOGV("AudioStreamOutWrapper::getParameters() %s", param.toString().string());
	return param.toString();
}

status_t AudioStreamOutWrapper::getRenderPosition(uint32_t *dspFrames)
{
        LOGV("AudioStreamOutWrapper::getRenderPosition(%p)", dspFrames);
	return INVALID_OPERATION;
}

AudioStreamInWrapper::AudioStreamInWrapper(AudioHardwareInterface *intf, AudioStreamIn *in, uint32_t devices, uint32_t sampleRate)
{
	LOGV("new AudioStreamInWrapper(%p)", in);
	mHardware = intf;
	hw = in;
	mDevices = devices;
	mSampleRate = sampleRate;
}

AudioStreamInWrapper::~AudioStreamInWrapper()
{
	LOGV("delete AudioStreamInWrapper()");
	delete hw;
}

uint32_t AudioStreamInWrapper::sampleRate() const
{
	LOGV("AudioStreamInWrapper::sampleRate() = %d", mSampleRate);
	return mSampleRate;
}

size_t AudioStreamInWrapper::bufferSize() const
{
	size_t s = hw->bufferSize();
	LOGV("AudioStreamInWrapper::bufferSize() = %d", s);
	return s;
}

uint32_t AudioStreamInWrapper::channels() const
{
	uint32_t c = hw->channelCount();
	LOGV("AudioStreamInWrapper::channels() = %d", c);
	return channelCountToInputChannels(c);
}

int AudioStreamInWrapper::format() const
{
	int f = hw->format();
	LOGV("AudioStreamInWrapper::format() = %d", f);
	return f;
}

status_t AudioStreamInWrapper::setGain(float gain)
{
	status_t s = hw->setGain(gain);
        LOGV("AudioStreamInWrapper::setGain(%1.2f) = %d", gain, s);
	return s;
}

ssize_t AudioStreamInWrapper::read(void* buffer, ssize_t bytes)
{
	ssize_t s = hw->read(buffer, bytes);
        LOGV("AudioStreamInWrapper::read(%p, %d) = %d", buffer, (int)bytes, (int)s);
	return s;
}

status_t AudioStreamInWrapper::dump(int fd, const Vector<String16>& args)
{
	status_t s = hw->dump(fd, args);
	LOGV("AudioStreamInWrapper::dump(%d, args) = %d", fd, s);
	return s;
}

status_t AudioStreamInWrapper::standby()
{
	status_t s = hw->standby();
        LOGV("AudioStreamInWrapper::standby() = %d", s);
	return s;
}

status_t AudioStreamInWrapper::setParameters(const String8& keyValuePairs)
{
        LOGV("AudioStreamInWrapper::setParameters(\"%s\")", keyValuePairs.string());

	AudioParameter param = AudioParameter(keyValuePairs);
	String8 key;
	status_t status = NO_ERROR;
	int device;

	// reading routing parameter
	key = String8(AudioParameter::keyRouting);
	if (param.getInt(key, device) == NO_ERROR) {
		LOGV("set input routing %x", device);
		if (device & (device - 1)) {
			status = BAD_VALUE;
		} else {
			mDevices = device;
			status = mHardware->doRouting();
		}
		param.remove(key);
	}

	if (param.size()) {
		status = BAD_VALUE;
	}
	return status;
}

String8 AudioStreamInWrapper::getParameters(const String8& keys)
{
        LOGV("AudioStreamInWrapper::getParameters(\"%s\")", keys.string());

	AudioParameter param = AudioParameter(keys);
	String8 value;
	String8 key = String8(AudioParameter::keyRouting);

	if (param.get(key, value) == NO_ERROR) {
		LOGV("get routing %x", mDevices);
		param.addInt(key, (int)mDevices);
	}

	LOGV("AudioStreamInWrapper::getParameters() %s", param.toString().string());
	return param.toString();
}

unsigned int AudioStreamInWrapper::getInputFramesLost() const
{
        LOGV("FIXME: AudioStreamInWrapper::getInputFramesLost()");
	return 0;
}

AudioHardwareWrapper::AudioHardwareWrapper()
{
	LOGV("new AudioHardwareWrapper()");
}

AudioHardwareWrapper::~AudioHardwareWrapper()
{
	LOGV("delete AudioHardwareWrapper()");
	delete mHardware;
}

status_t AudioHardwareWrapper::initCheck()
{
	status_t s = mHardware->initCheck();
	LOGV("AudioHardwareWrapper::initCheck() = %d", s);

	setMasterMute(false);
	setMode(AudioSystem::MODE_NORMAL);

	return s;
}

status_t AudioHardwareWrapper::setVoiceVolume(float volume)
{
	status_t s = mHardware->setVoiceVolume(volume);
	LOGV("AudioHardwareWrapper::setVoiceVolume(%1.2f) = %d", volume, s);
	return s;
}

status_t AudioHardwareWrapper::setMasterVolume(float volume)
{
	status_t s = mHardware->setMasterVolume(volume);
	LOGV("AudioHardwareWrapper::setMasterVolume(%1.2f) = %d", volume, s);
	return s;
}

status_t AudioHardwareWrapper::setMode(int mode)
{
	status_t s = mHardware->setMode(mode);
	LOGV("AudioHardwareWrapper::setMode(%d) = %d", mode, s);
	return s;
}

status_t AudioHardwareWrapper::setMicMute(bool state)
{
	status_t s = mHardware->setMicMute(state);
	LOGV("AudioHardwareWrapper::setMicMute(%d) = %d", state, s);
	return s;
}

status_t AudioHardwareWrapper::getMicMute(bool* state)
{
	status_t s = mHardware->getMicMute(state);
	LOGV("AudioHardwareWrapper::getMicMute(%p) = %d", state, s);
	return s;
}

status_t AudioHardwareWrapper::setParameters(const String8& keyValuePairs)
{
        LOGV("AudioHardwareWrapper::setParameters(\"%s\")", keyValuePairs.string());
	return NO_ERROR;
}

String8 AudioHardwareWrapper::getParameters(const String8& keys)
{
        LOGV("AudioStreamWrapper::getParameters(\"%s\")", keys.string());
	return String8("");
}

size_t AudioHardwareWrapper::getInputBufferSize(uint32_t sampleRate, int format, int channelCount)
{
	size_t s = mHardware->getInputBufferSize(sampleRate, format, channelCount);
        LOGV("AudioStreamWrapper::getInputBufferSize(%d, %d, %d) = %d", sampleRate, format, channelCount, s);
	return s;
}

AudioStreamOutWrapper* AudioHardwareWrapper::openOutputStream(uint32_t devices, int *format, uint32_t *channels, uint32_t *sampleRate, status_t *status)
{
	int f = 0;
	int c = 0;
	int s = 0;

	if (format)
		f = *format;
	if (channels)
		c = outputChannelsToChannelCount(*channels);
	if (sampleRate)
		s = *sampleRate;

	AudioStreamOut *out = mHardware->openOutputStream(f, c, s, status);
	LOGV("AudioHardwareWrapper::openOutputStream(0x%08x, %p, %p, %p, %p) = %p", devices, format, channels, sampleRate, status, out);

	if (*status == NO_ERROR)
        {
		AudioStreamOutWrapper *intf = new AudioStreamOutWrapper(this->mHardware, out, devices);
		if (format)
			*format = intf->format();
		if (channels)
			*channels = intf->channels();
		if (sampleRate)
			*sampleRate = intf->sampleRate();

		return intf;
        }

	if (out)
		delete out;
	return 0;
}

void AudioHardwareWrapper::closeOutputStream(AudioStreamOutWrapper* out)
{
	LOGV("AudioHardwareWrapper::closeOutputStream(%p)", out);
	delete out;
}

AudioStreamInWrapper* AudioHardwareWrapper::openInputStream(uint32_t devices, int *format, uint32_t *channels, uint32_t *sampleRate, status_t *status, AudioSystem::audio_in_acoustics acoustics)
{
	// check for valid input source
	if (!AudioSystem::isInputDevice((AudioSystem::audio_devices)devices)) {
		LOGV("AudioHardwareWrapper::openInputStream(): devices is not input device: 0x%08x", devices);
		return 0;
	}

	int f = 0;
	int c = 0;
	int s = 0;

	if (format)
		f = *format;
	if (channels)
		c = inputChannelsToChannelCount(*channels);
	if (sampleRate)
		s = *sampleRate;

	LOGV("AudioHardwareWrapper::openInputStream(): request format = %d, channels = %d, sampleRate = %d, acoustics = %d", f, c, s, acoustics);

	AudioStreamIn *in = mHardware->openInputStream(devicesToInput(devices), f, c, s, status, acoustics);
	LOGV("AudioHardwareWrapper::openInputStream(0x%08x, %p, %p, %p, %p, %d) = %p", devices, format, channels, sampleRate, status, acoustics, in);

	if (*status == NO_ERROR)
	{
		AudioStreamInWrapper *intf = new AudioStreamInWrapper(this->mHardware, in, devices, s);

		if (format)
			*format = intf->format();
		if (channels)
			*channels = intf->channels();
		if (sampleRate)
			*sampleRate = intf->sampleRate();

		return intf;
	}

	if (in)
		delete in;
	return 0;
}

void AudioHardwareWrapper::closeInputStream(AudioStreamInWrapper* in)
{
	LOGV("AudioHardwareWrapper::closeInputStream(%p)", in);
	delete in;
}

status_t AudioHardwareWrapper::dumpState(int fd, const Vector<String16>& args)
{
	status_t s = mHardware->dumpState(fd, args);
	LOGV("AudioHardwareWrapper::dumpState(%d, args) = %d", fd, s);
	return s;
}

status_t AudioHardwareWrapper::dump(int fd, const Vector<String16>& args)
{
	status_t s = mHardware->dump(fd, args);
	LOGV("AudioHardwareWrapper::dump(%d, args) = %d", fd, s);
	return s;
}

// -------------------------- IS01 specific functions -------------------------

status_t AudioHardwareWrapper::setStreamVolume(int stream, float volume)
{
	status_t s = mHardware->setStreamVolume(stream, volume);
	LOGV("AudioHardwareWrapper::setStreamVolume(%d, %1.2f) = %d", stream, volume, s);
	return s;
}

status_t AudioHardwareWrapper::setStreamMute(int stream, bool muted)
{
	status_t s = mHardware->setStreamMute(stream, muted);
	LOGV("AudioHardwareWrapper::setStreamMute(%d, %d) = %d", stream, muted, s);
	return s;
}

status_t AudioHardwareWrapper::isStreamActive(int stream)
{
	status_t s = mHardware->isStreamActive(stream);
	LOGV("AudioHardwareWrapper::isStreamActive(%d) = %d", stream, s);
	return s;
}

status_t AudioHardwareWrapper::setStreamType(int stream)
{
	status_t s = mHardware->setStreamType(stream);
	LOGV("AudioHardwareWrapper::setStreamType(%d) = %d", stream, s);
	return s;
}

status_t AudioHardwareWrapper::setDinMute(bool muted)
{
	status_t s = mHardware->setDinMute(muted);
	LOGV("AudioHardwareWrapper::setDinMute(%d) = %d", muted, s);
	return s;
}

status_t AudioHardwareWrapper::setMasterMute(bool muted)
{
	status_t s = mHardware->setMasterMute(muted);
	LOGV("AudioHardwareWrapper::setMasterMute(%d) = %d", muted, s);
	return s;
}

status_t AudioHardwareWrapper::forcedRouting(int mode, uint32_t routes, uint32_t unknown)
{
	status_t s = mHardware->forcedRouting(mode, routes, unknown);
	LOGV("AudioHardwareWrapper::forcedRouting(%d, 0x%08x, %d) = %d", mode, routes, unknown, s);
	return s;
}

status_t AudioHardwareWrapper::recoverRouting(int mode, uint32_t routes, uint32_t unknown)
{
	status_t s = mHardware->recoverRouting(mode, routes, unknown);
	LOGV("AudioHardwareWrapper::recoverRouting(%d, 0x%08x, %d) = %d", mode, routes, unknown, s);
	return s;
}

status_t AudioHardwareWrapper::setVoiceMute(bool muted)
{
	status_t s = mHardware->setVoiceMute(muted);
	LOGV("AudioHardwareWrapper::setVoiceMute(%d) = %d", muted, s);
	return s;
}

// ----------------------------------------------------------------------------

AudioHardwareWrapper* AudioHardwareWrapper::create()
{
	LOGV("AudioHardwareWrapper::create()");
	/*
	 * FIXME: This code needs to instantiate the correct audio device
	 * interface. For now - we use compile-time switches.
	 */
	AudioHardwareWrapper* intf = new AudioHardwareWrapper;
	char value[PROPERTY_VALUE_MAX];

#ifdef GENERIC_AUDIO
	intf->mHardware = new AudioHardwareGeneric();
#else
	// if running in emulation - use the emulator driver
	if (property_get("ro.kernel.qemu", value, 0)) {
		LOGV("Running in emulation - using generic audio driver");
		intf->mHardware = new AudioHardwareGeneric();
	}
	else {
		LOGV("Creating Vendor Specific AudioHardware");
		intf->mHardware = createAudioHardware();
	}
#endif
	if (intf->mHardware->initCheck() != NO_ERROR) {
		LOGV("Using stubbed audio hardware. No sound will be produced.");
		delete intf->mHardware;
		intf->mHardware = new AudioHardwareStub();
	}

#ifdef DUMP_FLINGER_OUT
	// This code adds a record of buffers in a file to write calls made by AudioFlinger.
	// It replaces the current AudioHardwareInterface object by an intermediate one which
	// will record buffers in a file (after sending them to hardware) for testing purpose.
	// This feature is enabled by defining symbol DUMP_FLINGER_OUT.
	// The output file is FLINGER_DUMP_NAME. Pause are not recorded in the file.

	// replace interface
	intf->mHardware = new AudioDumpInterface(intf->mHardware);
#endif

	return intf;
}


}; // namespace android
