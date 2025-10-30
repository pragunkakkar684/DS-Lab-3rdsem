#include <stdio.h>
#include <stdlib.h>

#define MAX 100

int A[MAX];
int front[10], rear[10], size[10], limit[10];
int n, m;

void initialize() {
    printf("Enter number of queues (n): ");
    scanf("%d", &n);
    printf("Enter total array size (m): ");
    scanf("%d", &m);

    int segment = m / n;
    for (int i = 0; i < n; i++) {
        front[i] = rear[i] = i * segment;
        size[i] = 0;
        limit[i] = segment;
    }
}

int QUEUE_FULL() {
    int total = 0;
    for (int i = 0; i < n; i++)
        total += size[i];
    return total == m;
}

void ADDQ(int i, int x) {
    if (size[i] == limit[i]) {
        printf("Queue %d is full\n", i);
        return;
    }

    A[rear[i]] = x;
    rear[i] = (rear[i] + 1) % limit[i] + (i * limit[i]);
    size[i]++;
    printf("Added %d to Queue %d\n", x, i);
}

void DELETEQ(int i) {
    if (size[i] == 0) {
        printf("Queue %d is empty\n", i);
        return;
    }

    int x = A[front[i]];
    front[i] = (front[i] + 1) % limit[i] + (i * limit[i]);
    size[i]--;
    printf("Deleted %d from Queue %d\n", x, i);
}

void display() {
    for (int i = 0; i < n; i++) {
        printf("Queue %d: ", i);
        int count = size[i];
        int idx = front[i];
        while (count--) {
            printf("%d ", A[idx]);
            idx = (idx + 1) % limit[i] + (i * limit[i]);
        }
        printf("\n");
    }
}

int main() {
    initialize();

    int choice, qid, val;
    while (1) {
        printf("\nMenu:\n");
        printf("1. Add to Queue\n");
        printf("2. Delete from Queue\n");
        printf("3. Check if Array is Full\n");
        printf("4. Display Queues\n");
        printf("5. Exit\n");
        printf("Enter choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter queue id (0 to %d): ", n - 1);
                scanf("%d", &qid);
                printf("Enter value: ");
                scanf("%d", &val);
                ADDQ(qid, val);
                break;
            case 2:
                printf("Enter queue id (0 to %d): ", n - 1);
                scanf("%d", &qid);
                DELETEQ(qid);
                break;
            case 3:
                if (QUEUE_FULL())
                    printf("Array is FULL\n");
                else
                    printf("Array is NOT full\n");
                break;
            case 4:
                display();
                break;
            case 5:
                exit(0);
        }
    }

    return 0;
}
