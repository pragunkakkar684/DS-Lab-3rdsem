#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* prev;
    struct Node* next;
} Node;

Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->prev = newNode->next = NULL;
    return newNode;
}

void insertEnd(Node** head, int data) {
    Node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
        return;
    }
    Node* temp = *head;
    while (temp->next != NULL)
        temp = temp->next;

    temp->next = newNode;
    newNode->prev = temp;
}

void displayList(Node* head) {
    Node* temp = head;
    while (temp != NULL) {
        printf("%d ", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

void concatenate(Node** X1, Node* X2) {
    if (*X1 == NULL) {
        *X1 = X2;
        return;
    }
    if (X2 == NULL) return;

    Node* temp = *X1;
    while (temp->next != NULL)
        temp = temp->next;

    temp->next = X2;
    X2->prev = temp;
}

int main() {
    Node* X1 = NULL;
    Node* X2 = NULL;

    insertEnd(&X1, 1);
    insertEnd(&X1, 2);
    insertEnd(&X1, 3);

    insertEnd(&X2, 4);
    insertEnd(&X2, 5);
    insertEnd(&X2, 6);

    printf("List X1 before concatenation: ");
    displayList(X1);

    printf("List X2 before concatenation: ");
    displayList(X2);

    concatenate(&X1, X2);

    printf("List X1 after concatenation: ");
    displayList(X1);

    return 0;
}

