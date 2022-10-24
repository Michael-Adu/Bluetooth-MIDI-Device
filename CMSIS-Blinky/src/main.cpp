
#include "stm32f4xx.h"

#define LED_GREEN (12)
#define LED_ORANGE (13)
#define LED_RED (14)
#define LED_BLUE (15)

#define MASK(X) (1 << X)
void ms_delay(int ms);

int main()
{
    // |= is a bitwise OR and assignment i.e. it sets the status of a bit, without changing the other bits
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;  // enable the clock to GPIO
    GPIOD->MODER |= GPIO_MODER_MODER12_0; // set pin 12 to be general purpose output
    GPIOD->MODER |= GPIO_MODER_MODER13_0; // set pin 13 to be general purpose output
    GPIOD->MODER |= GPIO_MODER_MODER14_0; // set pin 14 to be general purpose output
    GPIOD->MODER |= GPIO_MODER_MODER15_0; // set pin 15 to be general purpose output

    while (1)
    {
        ms_delay(500);
        GPIOD->ODR |= MASK(LED_GREEN); // Green LED
        GPIOD->ODR |= (1 << LED_ORANGE);
        GPIOD->ODR |= (1 << LED_RED);
        GPIOD->ODR |= (1 << LED_BLUE);
        ms_delay(500);
        GPIOD->ODR |= MASK(LED_GREEN); // Green LED
        GPIOD->ODR &= ~MASK(LED_ORANGE);
        GPIOD->ODR &= ~MASK(LED_RED);
        GPIOD->ODR &= ~MASK(LED_BLUE);
        ms_delay(500);
        GPIOD->ODR &= ~MASK(LED_GREEN); // Green LED
        GPIOD->ODR |= MASK(LED_ORANGE);
        GPIOD->ODR &= ~MASK(LED_RED);
        GPIOD->ODR &= ~MASK(LED_BLUE);
        ms_delay(500);
        GPIOD->ODR &= ~MASK(LED_GREEN); // Green LED
        GPIOD->ODR &= ~MASK(LED_ORANGE);
        GPIOD->ODR |= MASK(LED_RED);
        GPIOD->ODR &= ~MASK(LED_BLUE);
        ms_delay(500);
        GPIOD->ODR &= ~MASK(LED_GREEN); // Green LED
        GPIOD->ODR &= ~MASK(LED_ORANGE);
        GPIOD->ODR &= ~MASK(LED_RED);
        GPIOD->ODR |= MASK(LED_BLUE);
        ms_delay(500);
        GPIOD->ODR |= MASK(LED_GREEN); // Green LED
        GPIOD->ODR |= (1 << LED_ORANGE);
        GPIOD->ODR |= (1 << LED_RED);
        GPIOD->ODR |= (1 << LED_BLUE);
    }
    return 0;
}

void ms_delay(int ms)
{
    while (ms-- > 0)
    {
        volatile int x = 500; // volatile so that x is not removed by compiler due to optimisation
        while (x-- > 0)
            __asm("nop"); // inline assembly code for nop i.e. no operation
    }
}
