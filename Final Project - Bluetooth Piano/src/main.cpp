#include "mbed.h"
#include <string.h>
#define DAC_Frequency 44000

BufferedSerial bluetooth(D8, D2, 9600);
AnalogOut dac(PA_4);

Timer tim;
Ticker tic;
Ticker amplitudeReduce;
Ticker amplitudeDieDown;
DigitalOut led(PA_5);
class MusicKey
{
public:
  std::string key;
  int frequency;
  MusicKey(std::string myKey, int myFrequency);
};
MusicKey::MusicKey(std::string myKey, int myFrequency) : key(myKey), frequency(myFrequency){};

int freq;
int keyNum = 0;
volatile float amplitude = 1;
float outputSignal[4] = {0, 0, 0, 0};
string note;
MusicKey keys[31] = {
    {"C3", 131},
    {"c3", 138},
    {"D3", 147},
    {"d3", 156},
    {"E3", 165},
    {"F3", 175},
    {"f3", 185},
    {"G3", 196},
    {"g3", 207},
    {"A3", 220},
    {"a3", 233},
    {"B3", 246},
    {"C4", 262},
    {"c4", 277},
    {"D4", 293},
    {"d4", 311},
    {"E4", 330},
    {"F4", 349},
    {"f4", 370},
    {"G4", 392},
    {"g4", 415},
    {"A4", 440},
    {"a4", 466},
    {"B4", 494},
    {"C5", 523},
    {"1d", 60},
    {"2d", 218},
    {"3d", 65},
    {"4d", 87},
    {"5d", 128},
    {"6d", 150}};

void on_rx_interrupt();
void reduceAmp();
void signalCalculate(int frequency);
void dieDown();
void DAC_Int(void)
{
  signalCalculate(freq);
  dac.write(outputSignal[0]);
}

int main()
{
  tim.start();
  bluetooth.sigio(&on_rx_interrupt);
  tic.attach_us(&DAC_Int, 1000000 / DAC_Frequency);
  while (1)
  {
  }
}

void on_rx_interrupt()
{
  char c;
  if (bluetooth.readable())
  {
    bluetooth.read(&c, 1);
    char *token;
    token = strtok(&c, "^@");
    if (token != NULL)
    {
      note.append(token);

      if (note.length() == 3)
      {
        char play = 'p';
        if (note.find("p") != std::string::npos)
        {

          for (int j = 0; j < 31; j++)
          {
            if (keys[j].key == note.substr(0, 2).c_str())
            {
              amplitude = 1;
              if (j < (31 - 6))
              {
                amplitudeReduce.attach_us(&reduceAmp, 200000);
              }
              else
              {
                amplitudeDieDown.attach_us(&dieDown, 10000);
              }
              freq = keys[j].frequency;
              bluetooth.write(note.c_str(), 3);
              note.clear();
            }
          }
        }
        if (note.find(";") != std::string::npos)
        {
          bluetooth.write(note.c_str(), 3);
          note.clear();
        }
      }
    }
  }
}

void reduceAmp()
{
  amplitude = amplitude - 0.1;
  if (amplitude < 0.45)
  {
    amplitudeDieDown.attach_us(&dieDown, 130000);
    amplitudeReduce.detach();
  }
}

void dieDown()
{
  amplitude = amplitude - 0.05;
  if (amplitude < 0)
  {
    amplitudeDieDown.detach();
  }
}

void signalCalculate(int frequency)
{
  int period = 1000000 / freq;
  int pos = tim.read_us() % period;
  outputSignal[keyNum] = amplitude * (sin((pos * 3.14f * 2 / period)));
}