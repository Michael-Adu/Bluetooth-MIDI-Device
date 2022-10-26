#include <mbed.h>

#define Do 261.63 // middle C
#define Re 293.66 // D
#define Mi 329.63 // E
#define Fa 349.23 // F
#define So 392.00 // G
#define La 440.00 // A
#define Si 493.88 // B
#define No 0 // no sound

#define b1 0.5 // half note
#define b2 0.25 // quarter note
#define b3 0.125 // eighth note
#define b4 0.0625 // sixteenth note

float note[] = { Mi,No,Mi,No,Mi,No,  Mi,No,Mi,No,Mi,No,  Mi,No,So,No,Do,No,Re,No,Mi,No, Fa,No,Fa,No,Fa,No,Fa,No,  Fa,No,Mi,No,Mi,No,Mi,No,Mi,No,  Mi,Re,No,Re,Mi,  Re,No,So,No };
float beat[] = { b3,b3,b3,b3,b2,b2,  b3,b3,b3,b3,b2,b2,  b3,b3,b3,b3,b3,b3,b3,b3,b2,b1, b3,b3,b3,b3,b3,b3,b3,b3,  b3,b3,b3,b3,b3,b3,b4,b4,b4,b4,  b2,b3,b3,b2,b2,  b2,b2,b2,b2 };

AnalogIn volume(PC_1); // pin labelled A4 on arduino headers
AnalogIn speed(PC_0); // pin labelled A5 on arduino headers
PwmOut buzzer(PA_7); // pin labelled D7 on arduino headers
DigitalOut led(LED3); // only 1 user led on Nucleo F072RB

Ticker ticker;
static unsigned k = 0;

void onBeat();

int main() {
    led.write(1);        

    ticker.attach(&onBeat, 1); // start playing in 1 second

    while(1) {
        sleep(); // wait for an interrupt
    }
}

void onBeat() {
    // if we have not reached the end of the note array
    if (k < (sizeof(note)/sizeof(float) - 1)) {
        if (note[k] == No) {
            buzzer = 0;
            led = 0;
        } else {
            buzzer.period(1/note[k]); // period is the time taken to complete a full cycle of a wave, it is 1/frequency.
            buzzer = 0.9*volume.read(); // sets the ouput duty-cycle, specified as a percentage between 0.0f = 0% and 1.0f = 100%.
            // a higher duty cycle will have more on time and less off time.
            // this means the average power will be higher and hence the volume will be higher as well, at least upto a point.
            
            led = 1;
        }
        k++;
        ticker.attach(&onBeat, (beat[k] / 9) + (speed.read() / 2)); // reattach for the next note in the tune

    } else {
        k = 0;
        buzzer = 0;
    }
}
