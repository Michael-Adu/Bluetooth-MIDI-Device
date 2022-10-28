#include "mbed.h"
#include <string.h>
#define DAC_Frequency 44000

BufferedSerial bluetooth(D8, D2, 9600);
AnalogOut dac(PA_4);

Timer tim;
Ticker tic;
DigitalOut led(PA_5);
class MusicKey
{
public:
  std::string key;
  int frequency;
  MusicKey(std::string myKey, int myFrequency);
};
MusicKey::MusicKey(std::string myKey, int myFrequency) : key(myKey), frequency(myFrequency){};

int sel;
float amplitude = 0;
string note = "";
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
    {"b", 523}

};

void on_rx_interrupt();
void DAC_Int(void)
{
  int period = 1000000 / sel;
  int pos = tim.read_us() % period;
  dac = amplitude * sin(pos * 3.14f * 2 / period) / 2.0f + 0.5f;
}

int main()
{
  tim.start();
  // bluetooth.attach(&on_rx_interrupt, SerialBase::RxIrq);
  bluetooth.sigio(&on_rx_interrupt);
  tic.attach_us(&DAC_Int, 1000000 / DAC_Frequency);

  while (1)
  {
  }
}

void on_rx_interrupt()
{
  char c;
  char *token;
  if (bluetooth.readable())
  {
    bluetooth.read(&c, 1);
    token = strtok(&c, "^@Q");
    if (token != NULL)
    {
      if (note.length() > 2)
      {
        for (int j = 0; j < 13; j++)
        {
          string str_1 = keys[j].key;
          int res = str_1.find(&c);
          bluetooth.write(&c, 1);
          if (res == 0)
          {
            sel = keys[j].frequency;
          }
        }
      }
    }
  }
}
