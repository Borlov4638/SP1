package com.mriggle;

public class Main {
    static long time = System.nanoTime();

    static int[] arr1 = {0b01100100, 0b11111111, 0b11111010, 0b11110000, 0b00000001, 0b00000101, 0b00000110, 0b00000111, 0b00001001, 0b00001010} ;
   // int[] arr2 = new int[10] ;

    public static int invertHB(int tmp){
        int mask = 0b11111111;
        int temp1 = tmp^(1<<7);
        if (temp1 < tmp) {
            return (tmp^mask) ;
        }
            else return (tmp);
    }

    public static void main(String[] args) {
        int sum = 0;
        for (int i=0; i<arr1.length; i++){
            sum += invertHB(arr1[i]);
            //System.out.println(Integer.toBinaryString(invertHB(arr1[i])));

        }
        System.out.println(sum);
        time = System.nanoTime() - time;
        System.out.printf("Elapsed %,9.3f ms\n", time/1_000_000.0);
    }
}
