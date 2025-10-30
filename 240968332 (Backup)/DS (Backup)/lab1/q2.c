#include<stdio.h>

int main() {
    int arr[] = {1,2,3,4,5,6,7,8};
    int target = 7;
    int n = sizeof(arr) / sizeof(arr[0]);
    int start = 0;
    int end = n - 1;

    while(start <= end) {
        int mid = start + (end - start) / 2;
        if(target == arr[mid]) {
            printf("Target found at index %d\n", mid);
            return 0;
        }
        if(target < arr[mid]) {
            end = mid - 1;
        } else {
            start = mid + 1;
        }
    }
    printf("Target not found\n");
    return 0;
}
