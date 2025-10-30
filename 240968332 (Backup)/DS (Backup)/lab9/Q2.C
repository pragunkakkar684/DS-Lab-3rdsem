#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *left, *right;
} Node;

typedef struct Queue {
    Node* data[100];
    int front, rear;
} Queue;

void initQueue(Queue* q) {
    q->front = q->rear = 0;
}

int isQueueEmpty(Queue* q) {
    return q->front == q->rear;
}

void enqueue(Queue* q, Node* node) {
    q->data[q->rear++] = node;
}

Node* dequeue(Queue* q) {
    return q->data[q->front++];
}

Node* createTree() {
    int val;
    printf("Enter node value (-1 for NULL): ");
    scanf("%d", &val);

    if (val == -1)
        return NULL;

    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = val;

    printf("Enter left child of %d:\n", val);
    newNode->left = createTree();

    printf("Enter right child of %d:\n", val);
    newNode->right = createTree();

    return newNode;
}

void printLevelOrder(Node* root) {
    if (!root) return;

    Queue q;
    initQueue(&q);
    enqueue(&q, root);

    while (!isQueueEmpty(&q)) {
        Node* temp = dequeue(&q);
        printf("%d ", temp->data);
        if (temp->left) enqueue(&q, temp->left);
        if (temp->right) enqueue(&q, temp->right);
    }
}

int main() {
    printf("Create the binary tree:\n");
    Node* root = createTree();

    printf("\nLevel-order traversal of the tree:\n");
    printLevelOrder(root);

    return 0;
}
