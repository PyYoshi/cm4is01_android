/*
 * Copyright (C) 2007 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ANDROID_AUDIO_HARDWARE_INTERFACE_FROYO_H
#define ANDROID_AUDIO_HARDWARE_INTERFACE_FROYO_H

#include <stdint.h>
#include <sys/types.h>

#include <utils/Errors.h>
#include <utils/Vector.h>
#include <utils/String16.h>
#include <utils/String8.h>

#include <media/IAudioFlinger.h>
#include "media/AudioSystem.h"

#include <hardware_legacy/AudioHardwareInterface.h>

namespace android {

// ----------------------------------------------------------------------------

/**
 * AudioStreamOut is the abstraction interface for the audio output hardware.
 *
 * It provides information about various properties of the audio output hardware driver.
 */
class AudioStreamOutWrapper {
public:
    AudioStreamOutWrapper(AudioHardwareInterface *intf, AudioStreamOut *out, uint32_t devices);
    ~AudioStreamOutWrapper();

    /** return audio sampling rate in hz - eg. 44100 */
    uint32_t    sampleRate() const;

    /** returns size of output buffer - eg. 4800 */
    size_t      bufferSize() const;

    /**
     * returns the output channel nask
     */
    uint32_t    channels() const;

    /**
     * return audio format in 8bit or 16bit PCM format -
     * eg. AudioSystem:PCM_16_BIT
     */
    int         format() const;

    /**
     * return the frame size (number of bytes per sample).
     */
    uint32_t    frameSize() const { return AudioSystem::popCount(channels())*((format()==AudioSystem::PCM_16_BIT)?sizeof(int16_t):sizeof(int8_t)); }

    /**
     * return the audio hardware driver latency in milli seconds.
     */
    uint32_t    latency() const;

    /**
     * Use this method in situations where audio mixing is done in the
     * hardware. This method serves as a direct interface with hardware,
     * allowing you to directly set the volume as apposed to via the framework.
     * This method might produce multiple PCM outputs or hardware accelerated
     * codecs, such as MP3 or AAC.
     */
    status_t    setVolume(float left, float right);

    /** write audio buffer to driver. Returns number of bytes written */
    ssize_t     write(const void* buffer, size_t bytes);

    /**
     * Put the audio hardware output into standby mode. Returns
     * status based on include/utils/Errors.h
     */
    status_t    standby();

    /** dump the state of the audio output device */
    status_t dump(int fd, const Vector<String16>& args);

    status_t Open();

    // set/get audio output parameters. The function accepts a list of parameters
    // key value pairs in the form: key1=value1;key2=value2;...
    // Some keys are reserved for standard parameters (See AudioParameter class).
    // If the implementation does not accept a parameter change while the output is
    // active but the parameter is acceptable otherwise, it must return INVALID_OPERATION.
    // The audio flinger will put the output in standby and then change the parameter value.
    status_t    setParameters(const String8& keyValuePairs);
    String8     getParameters(const String8& keys);

    // return the number of audio frames written by the audio dsp to DAC since
    // the output has exited standby
    status_t    getRenderPosition(uint32_t *dspFrames);

private:
    AudioHardwareInterface *mHardware;
    AudioStreamOut *hw;
    uint32_t mDevices;
};

/**
 * AudioStreamIn is the abstraction interface for the audio input hardware.
 *
 * It defines the various properties of the audio hardware input driver.
 */
class AudioStreamInWrapper {
public:
    AudioStreamInWrapper(AudioHardwareInterface *intf, AudioStreamIn *in, uint32_t devices, uint32_t sampleRate);
    ~AudioStreamInWrapper();

    /** return audio sampling rate in hz - eg. 44100 */
    uint32_t    sampleRate() const;

    /** return the input buffer size allowed by audio driver */
    size_t      bufferSize() const;

    /** return input channel mask */
    uint32_t    channels() const;

    /**
     * return audio format in 8bit or 16bit PCM format -
     * eg. AudioSystem:PCM_16_BIT
     */
    int         format() const;

    /**
     * return the frame size (number of bytes per sample).
     */
    uint32_t    frameSize() const { return AudioSystem::popCount(channels())*((format()==AudioSystem::PCM_16_BIT)?sizeof(int16_t):sizeof(int8_t)); }

    /** set the input gain for the audio driver. This method is for
     *  for future use */
    status_t    setGain(float gain);

    /** read audio buffer in from audio driver */
    ssize_t     read(void* buffer, ssize_t bytes);

    /** dump the state of the audio input device */
    status_t dump(int fd, const Vector<String16>& args);

    /**
     * Put the audio hardware input into standby mode. Returns
     * status based on include/utils/Errors.h
     */
    status_t    standby();

    // set/get audio input parameters. The function accepts a list of parameters
    // key value pairs in the form: key1=value1;key2=value2;...
    // Some keys are reserved for standard parameters (See AudioParameter class).
    // If the implementation does not accept a parameter change while the output is
    // active but the parameter is acceptable otherwise, it must return INVALID_OPERATION.
    // The audio flinger will put the input in standby and then change the parameter value.
    status_t    setParameters(const String8& keyValuePairs);
    String8     getParameters(const String8& keys);


    // Return the amount of input frames lost in the audio driver since the last call of this function.
    // Audio driver is expected to reset the value to 0 and restart counting upon returning the current value by this function call.
    // Such loss typically occurs when the user space process is blocked longer than the capacity of audio driver buffers.
    // Unit: the number of input audio frames
    unsigned int  getInputFramesLost() const;

private:
    AudioHardwareInterface *mHardware;
    AudioStreamIn *hw;
    uint32_t mDevices;
    uint32_t mSampleRate;
};

/**
 * AudioHardwareInterface.h defines the interface to the audio hardware abstraction layer.
 *
 * The interface supports setting and getting parameters, selecting audio routing
 * paths, and defining input and output streams.
 *
 * AudioFlinger initializes the audio hardware and immediately opens an output stream.
 * You can set Audio routing to output to handset, speaker, Bluetooth, or a headset.
 *
 * The audio input stream is initialized when AudioFlinger is called to carry out
 * a record operation.
 */
class AudioHardwareWrapper
{
public:
    AudioHardwareWrapper();
    ~AudioHardwareWrapper();

    /**
     * check to see if the audio hardware interface has been initialized.
     * return status based on values defined in include/utils/Errors.h
     */
    status_t    initCheck();

    /** set the audio volume of a voice call. Range is between 0.0 and 1.0 */
    status_t    setVoiceVolume(float volume);

    /**
     * set the audio volume for all audio activities other than voice call.
     * Range between 0.0 and 1.0. If any value other than NO_ERROR is returned,
     * the software mixer will emulate this capability.
     */
    status_t    setMasterVolume(float volume);

    /**
     * setMode is called when the audio mode changes. NORMAL mode is for
     * standard audio playback, RINGTONE when a ringtone is playing, and IN_CALL
     * when a call is in progress.
     */
    status_t    setMode(int mode);

    // mic mute
    status_t    setMicMute(bool state);
    status_t    getMicMute(bool* state);

    // set/get global audio parameters
    status_t    setParameters(const String8& keyValuePairs);
    String8     getParameters(const String8& keys);

    // Returns audio input buffer size according to parameters passed or 0 if one of the
    // parameters is not supported
    size_t    getInputBufferSize(uint32_t sampleRate, int format, int channelCount);

    /** This method creates and opens the audio hardware output stream */
    AudioStreamOutWrapper* openOutputStream(
                                uint32_t devices,
                                int *format=0,
                                uint32_t *channels=0,
                                uint32_t *sampleRate=0,
                                status_t *status=0);
    void        closeOutputStream(AudioStreamOutWrapper* out);
    /** This method creates and opens the audio hardware input stream */
    AudioStreamInWrapper* openInputStream(
                                uint32_t devices,
                                int *format,
                                uint32_t *channels,
                                uint32_t *sampleRate,
                                status_t *status,
                                AudioSystem::audio_in_acoustics acoustics);
    void        closeInputStream(AudioStreamInWrapper* in);

    /**This method dumps the state of the audio hardware */
    status_t dumpState(int fd, const Vector<String16>& args);

    /** set the fm volume. Range is between 0.0 and 1.0 */
    status_t    setFmVolume(float volume) { return 0; }

    static AudioHardwareWrapper* create();

    /** IS01 specific functions */
    status_t setStreamVolume(int stream, float volume);
    status_t setStreamMute(int stream, bool muted);
    status_t isStreamActive(int stream);
    status_t setStreamType(int stream);
    status_t setDinMute(bool muted);
    status_t setMasterMute(bool muted);
    status_t forcedRouting(int mode, uint32_t routes, uint32_t unknown);
    status_t recoverRouting(int mode, uint32_t routes, uint32_t unknown);
    status_t setVoiceMute(bool muted);

protected:
    status_t dump(int fd, const Vector<String16>& args);

private:
    AudioHardwareInterface *mHardware;
};

// ----------------------------------------------------------------------------

extern "C" AudioHardwareWrapper* createAudioHardwareWrapper(void);

}; // namespace android

#endif // ANDROID_AUDIO_HARDWARE_INTERFACE_FROYO_H
