#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 100

char stack[MAX][MAX];
int top = -1;

void push(char *str) {
    strcpy(stack[++top], str);
}

char* pop() {
    return stack[top--];
}

void postfixToInfix(char *postfix, char *infix) {
    for (int i = 0; postfix[i]; ++i) {
        char ch = postfix[i];

        if (isalnum(ch)) {
            char operand[2] = {ch, '\0'};
            push(operand);
        } else {
            char *op2 = pop();
            char *op1 = pop();
            char temp[MAX];
            sprintf(temp, "(%s%c%s)", op1, ch, op2);
            push(temp);
        }
    }

    strcpy(infix, stack[top]);
}

int main() {
    char postfix[MAX], infix[MAX];
    printf("Enter postfix expression: ");
    scanf("%s", postfix);

    postfixToInfix(postfix, infix);
    printf("Fully parenthesized infix expression: %s\n", infix);

    return 0;
}
