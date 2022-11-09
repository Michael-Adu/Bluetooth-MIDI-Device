#include <mbed.h>
#include "N5110.h"


//       ( SCE,  RST,  D/C, MOSI, SCLK,  LED)

N5110 lcd(PA_4, PC_7, PA_9, PC_11, PC_10, PA_8);

int main()
{
  lcd.init();
  lcd.setContrast(0.4f);
  while (1)
  {

    // these are default settings so not strictly needed
    lcd.normalMode();        // normal colour mode
    lcd.setBrightness(0.5f); // put LED backlight on 50%

    lcd.clear();
    lcd.refresh();
    wait(5.0);

    lcd.clear(); // clear buffer at start of every loop
    // can directly print strings at specified co-ordinates (must be less than 84 pixels to fit on display)
    lcd.printString("I think I'm working", 0, 0);

    
  }
}