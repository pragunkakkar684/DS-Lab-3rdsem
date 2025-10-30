#include<stdio.h>
#include<stdlib.h>

typedef struct node{
    int data;
    struct node* next;
}node;

node* first = NULL;
node* last = NULL;

node* createnode(int data){
    node* newnode = (node*)malloc(sizeof(node));
    newnode->next = NULL;
    newnode->data = data;
    return newnode;
}

void insertend(int data){
    node* newnode = createnode(data);
    if(first == NULL){
        first = last = newnode;
        newnode->next = first;
    }else{
        last->next=newnode;
        last = newnode;
        last->next = first;
    }
    printf("Inserted %d at the end", data);
}

void deletebeg(){
    if(first == NULL){
        printf("The list is empty");
        return;
    }
    node* temp = first;
    if(first == last){
        first = last = NULL;
    }else{
        first = first->next;
        last->next = first;
    }
    free(temp);
}

void deleteend(){
    if(first == NULL){
        printf("The list is empty");
        return;
        }
    node* temp = first;
    if(first == last){
        printf("deleted %d from the end", first->data);
        free(first);
        first = last = NULL;
    }else{
        while(temp->next!=last){
            temp=temp->next;
        }
        free(last);
        last = temp;
        last->next= first;
    }
    }


void display(){
    if(first == NULL){
        printf("The list is empty");
        return;
    }
    node* temp = first;
    printf("List: ");
    do{
        printf("%d\t", temp->data);
        temp=temp->next;
    }while(temp!=first);
    printf("\n");
}

int main(){
    insertend(10);
    display();

    insertend(20);
    display();

    insertend(30);
    display();

    deletebeg();
    display();

    deleteend();
    display();

    deletebeg();
    display();

    return 0;
}
