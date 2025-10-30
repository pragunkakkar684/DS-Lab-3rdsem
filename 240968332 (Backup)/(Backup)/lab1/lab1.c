#include<stdio.h>

// Linear search
int main() {
    int target = 2;
    int arr[] = {1, 2, 3, 4, 5, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    int found = 0;

    for (int i = 0; i < n; i++) {
        if (arr[i] == target) {
            printf("Target found at index %d\n", i);
            found = 1;
            break;
        }
    }

    if (!found) {
        printf("Target not found\n");
    }

    return 0;
}
