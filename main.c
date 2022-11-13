#include <stdio.h>
#include <stdlib.h>

void fill_array(char* array, int array_size) {
    for (int i = 0; i < array_size; ++i) {
        scanf("%c", &array[i]);
    }
}

void print_array(char* array, int start, int n) {
    if (n == 1) {
        printf("%c\n", array[0]);
        return;
    }
    if (start != -1) {
        for (int i = start; i < start + n; ++i) {
            printf("%c", array[i]);
        }
    } else {
        printf("no such sequence");
    }
    printf("\n");
}

int main() {
     int n, array_size;
        scanf("%d %d\n", &n, &array_size);
        char* array = malloc(array_size * sizeof(char));
        fill_array(array, array_size);
        int start = -1;
        int cur = 1;
        int t = 0;
        for (int i = 0; i < array_size - 1; ++i) {
            if (array[i] > array[i + 1]) {
                cur++;
            } else {
                t = i + 1;
                cur = 1;
            }
            if (cur == n) {
                start = t;
                break;
            }
        }
        
        print_array(array, start, n);
    return 0;
}
