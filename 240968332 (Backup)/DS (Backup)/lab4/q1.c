#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node* next;
};

struct node* head = NULL;

struct node* createnode(int data) {
    struct node* newnode = (struct node*)malloc(sizeof(struct node));
    newnode->data = data;
    newnode->next = NULL;
    return newnode;
}

void insertbefore(int data, int before) {
    struct node* newnode = createnode(data);
    if (head == NULL) {
        printf("List is empty\n");
        return;
    }
    if (head->data == before) {
        newnode->next = head;
        head = newnode;
        return;
    }
    struct node* temp = head;
    while (temp->next && temp->next->data != before) {
        temp = temp->next;
    }
    if (temp->next == NULL) {
        printf("Element %d not found\n", before);
        free(newnode);
        return;
    }
    newnode->next = temp->next;
    temp->next = newnode;
}

void insertafter(int data, int after) {
    struct node* newnode = createnode(data);
    struct node* temp = head;
    while (temp && temp->data != after)
        temp = temp->next;
    if (temp == NULL) {
        printf("Element %d not found.\n", after);
        free(newnode);
        return;
    }
    newnode->next = temp->next;
    temp->next = newnode;
}

void deleteelement(int data) {
    if (head == NULL) {
        printf("List is empty\n");
        return;
    }
    if (head->data == data) {
        struct node* temp = head;
        head = head->next;
        free(temp);
        return;
    }
    struct node* temp = head;
    while (temp->next && temp->next->data != data)
        temp = temp->next;
    if (temp->next == NULL) {
        printf("Element %d not found\n", data);
        return;
    }
    struct node* todelete = temp->next;
    temp->next = todelete->next;
    free(todelete);
}

void traverse() {
    struct node* temp = head;
    if (!temp) {
        printf("The list is empty\n");
        return;
    }
    printf("List elements: ");
    while (temp) {
        printf("%d ", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

void reverse() {
    struct node *prev = NULL, *curr = head, *next = NULL;
    while (curr) {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }
    head = prev;
}

void sortlist() {
    if (!head || !head->next) return;
    int swapped;
    struct node* ptr1;
    struct node* lptr = NULL;
    do {
        swapped = 0;
        ptr1 = head;
        while (ptr1->next != lptr) {
            if (ptr1->data > ptr1->next->data) {
                int temp = ptr1->data;
                ptr1->data = ptr1->next->data;
                ptr1->next->data = temp;
                swapped = 1;
            }
            ptr1 = ptr1->next;
        }
        lptr = ptr1;
    } while (swapped);
}

void deletealternate() {
    struct node* temp = head;
    while (temp && temp->next) {
        struct node* todelete = temp->next;
        temp->next = todelete->next;
        free(todelete);
        temp = temp->next;
    }
}

void insertsorted(int data) {
    struct node* newnode = createnode(data);
    if (!head || head->data >= data) {
        newnode->next = head;
        head = newnode;
        return;
    }
    struct node* temp = head;
    while (temp->next && temp->next->data < data) {
        temp = temp->next;
    }
    newnode->next = temp->next;
    temp->next = newnode;
}

void menu() {
    int choice, data, ref;
    while (1) {
        printf("\n--- MENU ---\n");
        printf("1. Insert before element\n");
        printf("2. Insert after element\n");
        printf("3. Delete element\n");
        printf("4. Traverse list\n");
        printf("5. Reverse list\n");
        printf("6. Sort list\n");
        printf("7. Delete alternate nodes\n");
        printf("8. Insert into sorted list\n");
        printf("9. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        switch (choice) {
            case 1:
                printf("Enter data and element to insert before: ");
                scanf("%d %d", &data, &ref);
                insertbefore(data, ref);
                break;
            case 2:
                printf("Enter data and element to insert after: ");
                scanf("%d %d", &data, &ref);
                insertafter(data, ref);
                break;
            case 3:
                printf("Enter element to delete: ");
                scanf("%d", &data);
                deleteelement(data);
                break;
            case 4:
                traverse();
                break;
            case 5:
                reverse();
                printf("List reversed.\n");
                break;
            case 6:
                sortlist();
                printf("List sorted.\n");
                break;
            case 7:
                deletealternate();
                printf("Alternate nodes deleted.\n");
                break;
            case 8:
                printf("Enter data to insert into sorted list: ");
                scanf("%d", &data);
                insertsorted(data);
                break;
            case 9:
                exit(0);
            default:
                printf("Invalid choice\n");
        }
    }
}

int main() {
    menu();
    return 0;
}
