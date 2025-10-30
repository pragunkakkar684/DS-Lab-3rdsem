#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#define MAX 100

char stack[MAX];
int top = -1;

void push(char ch) {
    if (top < MAX - 1) {
        stack[++top] = ch;
    }
}

char pop() {
    if (top >= 0) {
        return stack[top--];
    }
    return '\0';
}

bool isPalindrome(char str[]) {
    top = -1;
    int len = strlen(str);

    for (int i = 0; i < len; i++) {
        push(str[i]);
    }

    for (int i = 0; i < len; i++) {
        if (str[i] != pop()) {
            return false;
        }
    }
    return true;
}

bool isValidParentheses(char expr[]) {
    top = -1;
    for (int i = 0; expr[i] != '\0'; i++) {
        char ch = expr[i];
        if (ch == '(' || ch == '{' || ch == '[') {
            push(ch);
        } else if (ch == ')' || ch == '}' || ch == ']') {
            if (top == -1) return false;
            char open = pop();
            if ((ch == ')' && open != '(') ||
                (ch == '}' && open != '{') ||
                (ch == ']' && open != '[')) {
                return false;
            }
        }
    }
    return top == -1;
}

int main() {
    char str1[MAX], expr1[MAX];

    printf("Enter a string to check for palindrome: ");
    scanf("%s", str1);
    if (isPalindrome(str1))
        printf("'%s' is a palindrome.\n", str1);
    else
        printf("'%s' is not a palindrome.\n", str1);

    printf("\nEnter an expression to check for matching parentheses: ");
    scanf("%s", expr1);
    if (isValidParentheses(expr1))
        printf("Parentheses are balanced.\n");
    else
        printf("Parentheses are NOT balanced.\n");

    return 0;
}
