#include "stdint.h"
#include "stdio.h"
#include "time.h"

//#define CLOCKS_PER_SEC 1000

uint8_t invertBytes(uint8_t tmp)
{
    uint8_t mask = 255;
    uint8_t tmp1 = tmp ^ 128;
    if (tmp1 < tmp)
    {
        return (tmp ^ mask);
    }
    else
    {
        return tmp;
    }

}

int main()
{
    double start = clock();
    double finish;
    uint8_t array[10] = { 100, 255, 250, 240, 1, 5, 6, 7, 9, 10 };
    uint16_t sum = 0;
    for (uint8_t i = 0; i < 10; i++)
    {
        sum += invertBytes(array[i]);
    }
    printf("%x", sum);
    printf("\n");
    finish = (clock() - start) / CLOCKS_PER_SEC;
    printf("%f", finish);
    printf("\n");
    return 0;
}
