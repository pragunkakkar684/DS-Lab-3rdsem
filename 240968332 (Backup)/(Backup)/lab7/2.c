#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>

#define MAX 100

typedef struct Node {
    char data;
    struct Node* next;
} Node;

void push(Node** top, char value) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = value;
    newNode->next = *top;
    *top = newNode;
}

char pop(Node** top) {
    if (*top == NULL) return '\0';
    Node* temp = *top;
    char val = temp->data;
    *top = temp->next;
    free(temp);
    return val;
}

char peek(Node* top) {
    return top ? top->data : '\0';
}

int isEmpty(Node* top) {
    return top == NULL;
}

int precedence(char op) {
    switch (op) {
        case '^': return 3;
        case '*':
        case '/': return 2;
        case '+':
        case '-': return 1;
        default: return 0;
    }
}

void infixToPostfix(char* infix, char* postfix) {
    Node* stack = NULL;
    int i = 0, j = 0;
    char ch;

    while ((ch = infix[i++]) != '\0') {
        if (isalnum(ch)) {
            postfix[j++] = ch;
        } else if (ch == '(') {
            push(&stack, ch);
        } else if (ch == ')') {
            while (!isEmpty(stack) && peek(stack) != '(')
                postfix[j++] = pop(&stack);
            pop(&stack);
        } else {
            while (!isEmpty(stack) && precedence(peek(stack)) >= precedence(ch))
                postfix[j++] = pop(&stack);
            push(&stack, ch);
        }
    }

    while (!isEmpty(stack))
        postfix[j++] = pop(&stack);

    postfix[j] = '\0';
}

typedef struct IntNode {
    int data;
    struct IntNode* next;
} IntNode;

void pushInt(IntNode** top, int value) {
    IntNode* newNode = (IntNode*)malloc(sizeof(IntNode));
    newNode->data = value;
    newNode->next = *top;
    *top = newNode;
}

int popInt(IntNode** top) {
    if (*top == NULL) return 0;
    IntNode* temp = *top;
    int val = temp->data;
    *top = temp->next;
    free(temp);
    return val;
}

int evaluatePostfix(char* postfix) {
    IntNode* stack = NULL;
    int i = 0;
    char ch;

    while ((ch = postfix[i++]) != '\0') {
        if (isdigit(ch)) {
            pushInt(&stack, ch - '0');
        } else {
            int b = popInt(&stack);
            int a = popInt(&stack);
            switch (ch) {
                case '+': pushInt(&stack, a + b); break;
                case '-': pushInt(&stack, a - b); break;
                case '*': pushInt(&stack, a * b); break;
                case '/': pushInt(&stack, a / b); break;
                case '^': pushInt(&stack, pow(a, b)); break;
            }
        }
    }

    return popInt(&stack);
}

int main() {
    char infix[MAX], postfix[MAX];

    printf("Enter infix expression (single-digit operands): ");
    scanf("%s", infix);

    infixToPostfix(infix, postfix);
    printf("Postfix expression: %s\n", postfix);

    int result = evaluatePostfix(postfix);
    printf("Evaluation result: %d\n", result);

    return 0;
}

