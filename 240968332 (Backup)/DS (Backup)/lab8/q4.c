#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME_LEN 50

typedef struct {
    char name[MAX_NAME_LEN];
    int age;
    int priority;
} Patient;

typedef struct Node {
    Patient data;
    struct Node* next;
} Node;

typedef struct {
    Node* front;
    Node* rear;
} PatientQueue;

void initQueue(PatientQueue* q) {
    q->front = NULL;
    q->rear = NULL;
}

void enqueue(PatientQueue* q, Patient p) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (!newNode) {
        printf("Memory allocation failed.\n");
        return;
    }
    newNode->data = p;
    newNode->next = NULL;

    if (q->rear == NULL) {
        q->front = q->rear = newNode;
    } else {
        q->rear->next = newNode;
        q->rear = newNode;
    }

    printf("Enqueued: %s, Age: %d, Priority: %d\n", p.name, p.age, p.priority);
}

Patient dequeue(PatientQueue* q) {
    Patient empty = {"None", -1, -1};
    if (q->front == NULL) {
        printf("Queue is empty. Cannot dequeue.\n");
        return empty;
    }

    Node* temp = q->front;
    Patient p = temp->data;
    q->front = q->front->next;

    if (q->front == NULL) {
        q->rear = NULL;
    }

    free(temp);
    printf("Dequeued: %s, Age: %d, Priority: %d\n", p.name, p.age, p.priority);
    return p;
}

void display(PatientQueue* q) {
    Node* current = q->front;
    if (!current) {
        printf("Queue is empty.\n");
        return;
    }

    printf("Patient Queue:\n");
    while (current) {
        printf("  Name: %s, Age: %d, Priority: %d\n",
               current->data.name, current->data.age, current->data.priority);
        current = current->next;
    }
}

int main() {
    PatientQueue q;
    initQueue(&q);

    Patient p1 = {"Alice", 30, 2};
    Patient p2 = {"Bob", 45, 1};
    Patient p3 = {"Charlie", 25, 3};

    enqueue(&q, p1);
    enqueue(&q, p2);
    enqueue(&q, p3);

    display(&q);

    dequeue(&q);
    display(&q);

    return 0;
}
