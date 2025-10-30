#include <stdio.h>
#include <stdlib.h>

int smallest(int *arr, int size) {
    int *min = arr;

    for (int i = 1; i < size; ++i) {
        if (*(arr + i) < *min) {
            min = arr + i;
        }
    }

    return *min;
}

int main() {
    int size;
    printf("Enter the number of elements: ");
    scanf("%d", &size);
    int *arr = (int *)malloc(size * sizeof(int));
    if (arr == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }
    printf("Enter %d elements:\n", size);
    for (int i = 0; i < size; ++i) {
        scanf("%d", arr + i);
    }
    int small = smallest(arr, size);
    printf("The smallest element is: %d\n", small);
    free(arr);

    return 0;
}
