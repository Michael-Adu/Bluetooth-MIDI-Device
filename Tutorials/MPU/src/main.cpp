#include <mbed.h>
#include "MPU6050.h"

BufferedSerial pc(USBTX, USBRX, 9600);
MPU6050 mpu;

int16_t ax, ay, az;
int16_t gx, gy, gz;

int main()
{
  mpu.initialize();
  pc.write("MPU6050 testConnection \n");

  bool mpu6050TestResult = mpu.testConnection();
  if (mpu6050TestResult)
  {
    pc.write("MPU6050 test passed \n");
  }
  else
  {
    pc.write("MPU6050 test failed \n");
  }

  while (1)
  {
    wait_us(1000000);
    mpu.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
    // writing current accelerometer and gyro position
    char buff[16];
    sprintf(buff, "ax = %d ,ay = %d ,az = %d , gx = %d, gy = %d, gz = %d\n", ax, ay, az, gx, gy, gz)
        pc.write(buff);
  }
}