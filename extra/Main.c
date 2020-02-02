/*
 * @file Main.c
 * @brief Main
 * @author Anemone,x565178035@126.com
 * @version 1.0
 * @date 2020-02-02 15:56
 */

#include <errno.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main() {


    return 0;
}
int func(int i, int m){
    int A[]={0,1,2}; // len(A)=9
    int y;
    if(i<m){
        y=i;                     // i<M
    } else{
        y=i%m;
    }
    return A[y];
}

