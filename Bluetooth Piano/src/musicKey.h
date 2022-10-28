#include "mbed.h"
#include <string>

class MusicKey
{
public:
    std::string key;
    int frequency;
    MusicKey(std::string myKey, int myFrequency);
};
MusicKey::MusicKey(std::string myKey, int myFrequency) : key(myKey), frequency(myFrequency){};
int freq_table[] = {
    262, // C
    277, // C#
    293, // D
    311, // D#
    330, // E
    349, // F
    370, // F#
    392, // G
    415, // G#
    440, // A
    466, // A#
    494, // B
    523  // C
};


extern MusicKey keys[13] = {
    {"C", 262},
    {"Cs", 277},
    {"D", 293},
    {"Ds", 311},
    {"E", 330},
    {"F", 349},
    {"Fs", 370},
    {"G", 392},
    {"Gs", 415},
    {"A", 440},
    {"As", 466},
    {"B", 494},
    {"C", 523}
    
};
