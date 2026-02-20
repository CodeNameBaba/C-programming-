#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <Windows.h>
void loading() {
    printf(" Loading...\n");
    for (int i = 0; i < 100; i++) {
        printf("\r[");
        for (int j = 0; j < i / 5; j++) {
            printf("#");
        }
        for (int j = i / 5; j < 20; j++) {
            printf(" ");
        }
        printf("]%d%%", i);
        Sleep(40);
    }
}
int main(){
   loading();
}