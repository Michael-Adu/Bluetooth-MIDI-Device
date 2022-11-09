#include <mbed.h>
#include "N5110.h"

//       ( SCE,  RST,  D/C, MOSI, SCLK,  LED)
int sprite[8][5] = {
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 0, 1, 0, 0},
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1},
    {1, 1, 0, 1, 1},
    {1, 1, 0, 1, 1},
};

N5110 lcd(D5, D6, D7, D11, D13, D4);

int main()
{
  lcd.init();
  lcd.setContrast(0.3f);
  lcd.normalMode();        // normal colour mode
  lcd.setBrightness(0.5f); // put LED backlight on 50%
  lcd.clear();
  lcd.refresh();

  wait_us(500);
  while (1)
  {

    // can directly print strings at specified co-ordinates (must be less than 84 pixels to fit on display)
    lcd.printString("PLEASE", 0, 0);
    lcd.refresh();

    wait_us(1000000);
    lcd.clear();
  }
}
