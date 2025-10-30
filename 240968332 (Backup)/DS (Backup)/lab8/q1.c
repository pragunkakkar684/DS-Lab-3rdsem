#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_NAME_LEN 50
#define MAX_QUEUE_SIZE 100

typedef struct {
    int documentID;
    char name[MAX_NAME_LEN];
} PrintJob;

typedef struct {
    PrintJob jobs[MAX_QUEUE_SIZE];
    int front;
    int rear;
} PrinterQueue;

void initQueue(PrinterQueue *q) {
    q->front = 0;
    q->rear = 0;
}

int isFull(PrinterQueue *q) {
    return q->rear == MAX_QUEUE_SIZE;
}

int isEmpty(PrinterQueue *q) {
    return q->front == q->rear;
}

void enqueue(PrinterQueue *q, PrintJob job) {
    if (isFull(q)) {
        printf("Queue is full. Cannot add job %d.\n", job.documentID);
        return;
    }
    q->jobs[q->rear++] = job;
    printf("Enqueued: Document ID %d, Name: %s\n", job.documentID, job.name);
}

PrintJob dequeue(PrinterQueue *q) {
    PrintJob emptyJob = {-1, "None"};
    if (isEmpty(q)) {
        printf("Queue is empty. No job to print.\n");
        return emptyJob;
    }
    return q->jobs[q->front++];
}

void generateRandomName(char *name) {
    const char *prefixes[] = {"Report", "Invoice", "Memo", "Letter", "Form"};
    int index = rand() % 5;
    sprintf(name, "%s_%d", prefixes[index], rand() % 1000);
}

int main() {
    PrinterQueue queue;
    initQueue(&queue);
    srand(time(NULL));

    int totalJobs = 10;

     for (int i = 0; i < totalJobs; i++) {
        PrintJob job;
        job.documentID = i + 1;
        generateRandomName(job.name);
        enqueue(&queue, job);
    }

    printf("\n--- Printing Jobs ---\n");
    while (!isEmpty(&queue)) {
        PrintJob job = dequeue(&queue);
        printf("Printing: Document ID %d, Name: %s\n", job.documentID, job.name);
    }

    return 0;
}
