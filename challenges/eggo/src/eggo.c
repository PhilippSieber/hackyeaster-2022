#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>

int amount = 0;
char* eggs[5];

void delete_egg() {
    int index;
    int result = scanf("%d", &index);
    
    if (result == EOF) {
        return;
    } 
    
    free(eggs[index]);
    eggs[index] = NULL; // Prevent UAF and double frees
    
    printf("Egg deleted\n");
}

void edit_egg() {
    int index;
    int result = scanf("%d ", &index);
    
    if (result == EOF) {
        return;
    }
    
    if (index < amount && eggs[index] != NULL) {
        // Heap overflow vulnerability!
        gets(eggs[index]);
        printf("Egg edited\n");
    } else {
        printf("That egg doesn't exist\n");
    }
}

void weigh_egg() {
        int index;
        int result = scanf("%d", &index);

        if (result == EOF) {
            return;
        }

        if (index < amount && eggs[index] != NULL) {
            int length = strlen(eggs[index]);
            printf("That egg weighs %d\n", length);
        } else {
            printf("That egg doesn't exist\n");
        }
}

void create_egg() {
        if (amount >= 5) {
            printf("Too many eggs\n");
            return;
        }

        int size;
        int result = scanf("%d", &size);

        if (result == EOF) {
            return;
        }

        if (size < 0 || size > 0x420) {
            printf("Invalid egg size\n");
        } else {
            eggs[amount++] = malloc(size);
            printf("Created egg %d\n", amount - 1);
        }
}

int main() {
    // Disable buffering
    setbuf(stdout, NULL);
    setbuf(stdin, NULL);
    
    printf("\n");
    printf("          ▓▓██          \n");
    printf("      ▓▓▓▓░░▒▒▓▓██      \n");
    printf("    ▓▓░░░░░░░░▒▒▒▒██    \n");
    printf("    ▓▓░░░░░░░░░░▒▒██    \n");
    printf("  ▓▓░░░░░░░░░░░░▒▒▒▒██  \n");
    printf("  ▓▓░░░░░░░░░░░░▒▒▒▒██  \n");
    printf("▓▓░░░░░░░░░░░░░░▒▒▒▒▒▒██\n");
    printf("▓▓░░░░░░░░░░░░░░▒▒▒▒▒▒██\n");
    printf("▓▓▒▒░░░░░░░░░░░░▒▒▒▒▒▒██\n");
    printf("  ▓▓░░░░░░░░░░▒▒▒▒▒▒██  \n");
    printf("  ▓▓▒▒▒▒░░░░▒▒▒▒▒▒▒▒██  \n");
    printf("    ████▒▒▒▒▒▒▒▒████    \n");
    printf("        ████████        \n");
    printf("\n");
    
    printf("1 Create egg\n");
    printf("2 Delete egg\n");
    printf("3 Weigh egg\n");
    printf("4 Edit egg\n");
    
    while (1) {
        printf("> ");
    
        int choice;
        int result = scanf("%d", &choice);
    
        // Prevents faulty inputs such as Ctrl + D
        if (result == NULL || result == EOF) {
            return 0;
        }
    
        if (choice == 1) {
            create_egg();
        } else if (choice == 2)  {
            delete_egg();
        } else if (choice == 3) {
            weigh_egg();
        } else if (choice == 4) {
            edit_egg();
        }
    }
}

                                                                         
