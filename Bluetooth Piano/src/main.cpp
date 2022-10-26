#include "mbed.h"
#include <string.h>
// DAC 20khz
#define DAC_Frequency 20000

UnbufferedSerial bluetooth(D8, D2, 9600);
AnalogOut dac(PA_4);

Timer tim;
Ticker tic;

// C, C# D, D# E, F, F#, G, G#, A, A#, B, C
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
int sel;

void on_rx_interrupt();

void DAC_Int(void)
{
  int period = 1000000 / sel;
  int pos = tim.read_us() % period;
  dac = sin(pos * 3.14f * 2 / period) / 2.0f + 0.5f;
}

int main()
{
  sel = 0;

  tim.start();
  bluetooth.attach(&on_rx_interrupt, SerialBase::RxIrq);

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
    token = strtok(&c, "@^");
    if (token != NULL)
    {
      int value = atoi(&c);
      try{
      sel = freq_table[value - 1];
      }
      catch(int e){

      }
      bluetooth.write(&c, 2);
    }
  }
}
