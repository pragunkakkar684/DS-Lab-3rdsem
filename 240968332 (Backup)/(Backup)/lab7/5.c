#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

#define MAX 100

int stack[MAX];
int top = -1;

void push(int val) {
    stack[++top] = val;
}

int pop() {
    return stack[top--];
}

int evaluate(char op, int a, int b) {
    switch (op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return a / b;
        case '^': return (int)pow(a, b);
        default:
            printf("Invalid operator: %c\n", op);
            exit(1);
    }
}

int evaluatePrefix(char *expr) {
    int len = strlen(expr);

    for (int i = len - 1; i >= 0; i--) {
        char ch = expr[i];

        if (isdigit(ch)) {
            push(ch - '0');
        } else {
            int op1 = pop();
            int op2 = pop();
            int result = evaluate(ch, op1, op2);
            push(result);
        }
    }

    return pop();
}

int main() {
    char expr[MAX];
    printf("Enter prefix expression: ");
    scanf("%s", expr);

    int result = evaluatePrefix(expr);
    printf("Result: %d\n", result);

    return 0;
}
