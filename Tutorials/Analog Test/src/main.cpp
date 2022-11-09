#include <mbed.h>
AnalogIn potentiometer(PA_1);
PwmOut led(PWM_OUT);

int main() {

  while(1) {
    float analogValue = potentiometer.read();
    led.write(potentiometer.read());
  }

}