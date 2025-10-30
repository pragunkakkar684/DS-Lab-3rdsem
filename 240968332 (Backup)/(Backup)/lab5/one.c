#include<stdio.h>
#include<stdlib.h>

typedef struct node {
    int data;
    struct node* prev;
    struct node* next;
} node;

node* head = NULL;
node* tail = NULL;

//create node
node* createnode(int data){
    node* newnode = (node*)malloc(sizeof(node));
    newnode->data = data;
    newnode->prev=newnode->next=NULL;
    return newnode;
}

//insert at rear
void insertrear(int data){
    node* newnode = createnode(data);
    if(!head){
        head = tail = newnode;
    }else{
        tail->next=newnode;
        newnode->prev = tail;
        tail=newnode;
    }
}

//delete from rear
void deleterear(){
    if(!tail){
        printf("The list is empty");
    }
    node* temp = tail;
    if(head==tail){
        head= tail = NULL;
    }else{
        tail = tail->prev;
        tail->next = NULL;
    }
    free(temp);
    printf("deleted from rear");
}

//insert at position
void insertatposition(int data, int pos){
    node* newnode = createnode(data);
    if(pos==1){
        newnode->next=head;
        if(head) head->prev = newnode;
        head = newnode;
        if(!tail) tail = newnode;
        return;
    }

    node* temp = head;
    for(int i = 1; temp&&i<pos-1;i++){
        temp = temp->next;
    }
    if(!temp){
        printf("Invalid position");
        return;
    }
    newnode->next = temp->next;
    newnode->prev=temp;
    if(temp->next) temp->next->prev = newnode;
    temp->next=newnode;
    if(!newnode->next) tail = newnode;
}

//delete from position
void deleteposition(int pos){
    if(!head){
        printf("The list is empty");
        return;
    }
    node* temp = head;
    if(pos==1){
        head=head->next;
        if(head) head->prev=NULL;
        else tail=NULL;
        free(temp);
        return;
    }
    for(int i = 1; temp&&i<pos;i++){
        temp = temp->next;
    }
    if(!temp){
        printf("Invalid position");
        return;
    }
    if(temp->prev) temp->prev->next=temp->next;
    if(temp->next) temp->next->prev=temp->prev;
    if(temp==tail) tail = temp->prev;
    free(temp);
}

//insert after value
void insertaftervalue(int data, int val){
    node* temp = head;
    while(temp && temp->data!=val){
        temp = temp->next;
    }
    if(!temp){
        printf("Value not found");
        return;
    }
    node* newnode = createnode(data);
    newnode->next = temp->next;
    newnode->prev = temp;
    if(temp->next) temp->next->prev = newnode;
    temp->next=newnode;
    if(!newnode->next) tail = newnode;
}

//insert before value
void insertbeforevalue(int data, int value) {
    node* temp = head;
    while (temp && temp->data != value)
        temp = temp->next;

    if (!temp) {
        printf("Value not found");
        return;
    }

    node* newNode = createnode(data);
    newNode->next = temp;
    newNode->prev = temp->prev;
    if (temp->prev) temp->prev->next = newNode;
    else head = newNode;
    temp->prev = newNode;
}

//traverse forward
void traverseforward() {
    node* temp = head;
    printf("List (forward): ");
    while (temp) {
        printf("%d ", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

//traverse backward
void traversereverse() {
    node* temp = tail;
    printf("List (reverse): ");
    while (temp) {
        printf("%d ", temp->data);
        temp = temp->prev;
    }
    printf("\n");
}

void menu() {
    int choice, data, pos, value;
    while (1) {
        printf("\nMenu\n");
        printf("1. Insert at rear\n");
        printf("2. Delete from rear\n");
        printf("3. Insert at position\n");
        printf("4. Delete from position\n");
        printf("5. Insert after value\n");
        printf("6. Insert before value\n");
        printf("7. Traverse forward\n");
        printf("8. Traverse reverse\n");
        printf("9. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter data: ");
                scanf("%d", &data);
                insertrear(data);
                break;
            case 2:
                deleterear();
                break;
            case 3:
                printf("Enter data and position: ");
                scanf("%d %d", &data, &pos);
                insertatposition(data, pos);
                break;
            case 4:
                printf("Enter position: ");
                scanf("%d", &pos);
                deleteposition(pos);
                break;
            case 5:
                printf("Enter data and value to insert after: ");
                scanf("%d %d", &data, &value);
                insertaftervalue(data, value);
                break;
            case 6:
                printf("Enter data and value to insert before: ");
                scanf("%d %d", &data, &value);
                insertbeforevalue(data, value);
                break;
            case 7:
                traverseforward();
                break;
            case 8:
                traversereverse();
                break;
            case 9:
                exit(0);
            default:
                printf("Invalid choice.\n");
        }
    }
}

int main() {
    menu();
    return 0;
}



