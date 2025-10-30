#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

char stack[MAX];
int top = -1;

char strStack[MAX][MAX];
int strTop = -1;

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

int isRightAssociative(char op) {
    return op == '^';
}

void push(char ch) {
    stack[++top] = ch;
}

char pop() {
    return stack[top--];
}

char peek() {
    return stack[top];
}

int isEmpty() {
    return top == -1;
}

void pushStr(char *str) {
    strcpy(strStack[++strTop], str);
}

char* popStr() {
    return strStack[strTop--];
}

void reverse(char *exp) {
    int len = strlen(exp);
    for (int i = 0; i < len / 2; ++i) {
        char temp = exp[i];
        exp[i] = exp[len - i - 1];
        exp[len - i - 1] = temp;
    }
}

void swapBrackets(char *exp) {
    for (int i = 0; exp[i]; ++i) {
        if (exp[i] == '(') exp[i] = ')';
        else if (exp[i] == ')') exp[i] = '(';
    }
}

void infixToPrefix(char *infix, char *prefix) {
    char revInfix[MAX];
    strcpy(revInfix, infix);
    reverse(revInfix);
    swapBrackets(revInfix);

    for (int i = 0; revInfix[i]; ++i) {
        char ch = revInfix[i];

        if (isalnum(ch)) {
            char operand[2] = {ch, '\0'};
            pushStr(operand);
        } else if (ch == '(') {
            push(ch);
        } else if (ch == ')') {
            while (!isEmpty() && peek() != '(') {
                char op = pop();
                char *op1 = popStr();
                char *op2 = popStr();
                char temp[MAX];
                sprintf(temp, "%c%s%s", op, op2, op1);
                pushStr(temp);
            }
            pop();
        } else {
            while (!isEmpty() && precedence(peek()) > precedence(ch) ||
                   (!isRightAssociative(ch) && precedence(peek()) == precedence(ch))) {
                char op = pop();
                char *op1 = popStr();
                char *op2 = popStr();
                char temp[MAX];
                sprintf(temp, "%c%s%s", op, op2, op1);
                pushStr(temp);
            }
            push(ch);
        }
    }

    while (!isEmpty()) {
        char op = pop();
        char *op1 = popStr();
        char *op2 = popStr();
        char temp[MAX];
        sprintf(temp, "%c%s%s", op, op2, op1);
        pushStr(temp);
    }

    strcpy(prefix, strStack[strTop]);
}

int main() {
    char infix[MAX], prefix[MAX];
    printf("Enter infix expression: ");
    scanf("%s", infix);

    infixToPrefix(infix, prefix);
    printf("Prefix expression: %s\n", prefix);

    return 0;
}
