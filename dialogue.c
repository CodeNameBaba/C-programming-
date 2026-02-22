#include <stdio.h>
#include <windows.h>

void typeText(const char *text, int speed) {
    while (*text) {
        putchar(*text++);
        Sleep(speed);
    }
}

int main() {
    typeText("Foul Tarnished...\n", 50);
    typeText("Emboldened by the flame of ambition.\n", 40);
    typeText("Someone must extinguish thy flame.\n", 40);
    return 0;
}