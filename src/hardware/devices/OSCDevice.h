#ifndef OSC_DEVICE_H
#define OSC_DEVICE_H

#include <io/network/udpSocket.h>
#include "hardware/hardwareOutputDevice.h"

#include <stdint.h>
#include <thread>

class OSCDevice : public HardwareOutputDevice
{
private:
    std::thread update_thread;
    sp::io::network::UdpSocket socket;

    bool run_thread;
public:
    OSCDevice();
    virtual ~OSCDevice();

    virtual bool configure(std::unordered_map<string, string> settings) override;

    virtual void setChannelData(int channel, float value) override;

    virtual int getChannelCount() override;

private:
    void updateLoop();
};

#endif//OSC_DEVICE_H
