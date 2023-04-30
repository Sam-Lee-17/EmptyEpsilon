#include <string.h>

#include "OSCDevice.h"
#include "random.h"
#include "logging.h"

#include <oscpp/client.hpp>

OSCDevice::OSCDevice()
{
    run_thread = false;
}

OSCDevice::~OSCDevice()
{
    if (run_thread)
    {
        run_thread = false;
        update_thread.join();
    }
}

bool OSCDevice::configure(std::unordered_map<string, string> settings)
{
    // TODO: This is where we bring in the IP address
    // TODO: This is where we bring in the port number
    // TODO: This is where we bring in the choice of TCP / UDP
    // TODO: This is where we bring in the OSC address prefix, e.g. /COGS/something/whatever

    if (settings.find("name-of-setting") != settings.end())
    {
        // Add settings processing in here
    }
    
    run_thread = true;
    update_thread = std::thread(&OSCDevice::updateLoop, this);
    return true;
}

//Set a hardware channel output. Value is 0.0 to 1.0 for no to max output.
void OSCDevice::setChannelData(int channel, float value)
{
    // Set channel data here
}

//Return the number of output channels supported by this device.
int OSCDevice::getChannelCount()
{
    // Return the number of channels
    return 1;
}

void OSCDevice::updateLoop()
{
    while(run_thread)
    {
        // Send updates
    }
}


size_t makePacket(void* buffer, size_t size)
{
    // Construct a packet
    OSCPP::Client::Packet packet(buffer, size);
    packet
        // Open a bundle with a timetag
        .openBundle(1234ULL)
            // Add a message with two arguments and an array with 6 elements;
            // for efficiency this needs to be known in advance.
            .openMessage("/s_new", 2 + OSCPP::Tags::array(6))
                // Write the arguments
                .string("sinesweep")
                .int32(2)
                .openArray()
                    .string("start-freq")
                    .float32(330.0f)
                    .string("end-freq")
                    .float32(990.0f)
                    .string("amp")
                    .float32(0.4f)
                .closeArray()
            // Every `open` needs a corresponding `close`
            .closeMessage()
            // Add another message with one argument
            .openMessage("/n_free", 1)
                .int32(1)
            .closeMessage()
            // And nother one
            .openMessage("/n_set", 3)
                .int32(1)
                .string("wobble")
                // Numeric arguments are converted automatically
                // (see below)
                .int32(31)
            .closeMessage()
        .closeBundle();
    return packet.size();
}