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
volatile float amplitude = 1;
float outputSignal[4] = {0, 0, 0, 0};
char note[1];
MusicKey keys[13] = {
    {"C", 262},
    {"c", 277},
    {"D", 293},
    {"d", 311},
    {"E", 330},
    {"F", 349},
    {"f", 370},
    {"G", 392},
    {"g", 415},
    {"A", 440},
    {"a", 466},
    {"B", 494},
    {"b", 523}};

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
      {

        for (int j = 0; j < 13; j++)
        {
          if (keys[j].key.compare(token) == 0)
          {
            amplitude = 1;
            amplitudeReduce.attach_us(&reduceAmp, 200000);
            freq = keys[j].frequency;
            signalCalculate(freq);
          }
        }
        char l;
        sprintf(&l, "%d", (int)(outputSignal[0] * 100));
        bluetooth.write(&l, 4);
      }
    }
  }
}

void reduceAmp()
{
  amplitude = amplitude - 0.1;
  if (amplitude < 0.7)
  {
    amplitudeDieDown.attach_us(&dieDown, 130000);
    amplitudeReduce.detach();
  }
}

void dieDown()
{
  amplitude = amplitude - 0.1;
  if (amplitude < 0)
  {
    amplitudeDieDown.detach();
  }
}

void signalCalculate(int frequency)
{
  int period = 1000000 / freq;
  int pos = tim.read_us() % period;
  outputSignal[0] = amplitude * (sin((pos * 3.14f * 2 / period)));
}