#include <windows.h>
#include <stdio.h>

void setColor(int color) {
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), color);
}

int main() {
       setColor(12); // Light Red
    printf("Light Red\n");

    setColor(10); //Light Green 
    printf("Light Green\n");

    setColor(7); //White 
    printf("White\n");

    return 0;
}
