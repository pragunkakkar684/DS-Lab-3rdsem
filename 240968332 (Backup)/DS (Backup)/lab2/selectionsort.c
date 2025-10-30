#include <stdio.h>
#include <stdlib.h>

void recursivess(int *arr, int start, int size) {
    if (start >= size - 1)
        return;
    int minIndex = start;
    for (int i = start + 1; i < size; ++i) {
        if (*(arr + i) < *(arr + minIndex)) {
            minIndex = i;
        }
    }
    if (minIndex != start) {
        int temp = *(arr + start);
        *(arr + start) = *(arr + minIndex);
        *(arr + minIndex) = temp;
    }
    recursivess(arr, start + 1, size);
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
    printf("Enter %d integers:\n", size);
    for (int i = 0; i < size; ++i) {
        scanf("%d", arr + i);
    }
    recursivess(arr, 0, size);

    printf("Sorted array:\n");
    for (int i = 0; i < size; ++i) {
        printf("%d ", *(arr + i));
    }
    printf("\n");
    free(arr);
    return 0;
}
