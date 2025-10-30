#include <stdio.h>

// a) Length of the string
int stringLength(char str[]) {
    int length = 0;
    while (str[length] != '\0') {
        length++;
    }
    return length;
}

// b) String concatenation
void stringConcat(char str1[], char str2[], char result[]) {
    int i = 0, j = 0;
    while (str1[i] != '\0') {
        result[i] = str1[i];
        i++;
    }
    while (str2[j] != '\0') {
        result[i] = str2[j];
        i++;
        j++;
    }

    result[i] = '\0';
}

// c) String comparison
int stringCompare(char str1[], char str2[]) {
    int i = 0;
    while (str1[i] != '\0' && str2[i] != '\0') {
        if (str1[i] != str2[i]) {
            return str1[i] - str2[i];
        }
        i++;
    }
    return str1[i] - str2[i];
}

// d) Insert a substring
void insertSubstring(char str[], char sub[], int pos, char result[]) {
    int i = 0, j = 0;
    while (i < pos) {
        result[i] = str[i];
        i++;
    }
    while (sub[j] != '\0') {
        result[i] = sub[j];
        i++;
        j++;
    }
    j = pos;
    while (str[j] != '\0') {
        result[i] = str[j];
        i++;
        j++;
    }

    result[i] = '\0';
}

// e) Delete a substring
void deleteSubstring(char str[], int pos, int len, char result[]) {
    int i = 0, j = 0;
    while (i < pos) {
        result[i] = str[i];
        i++;
    }
    j = pos + len;
    while (str[j] != '\0') {
        result[i] = str[j];
        i++;
        j++;
    }
    result[i] = '\0';
}

int main() {
    char str1[100], str2[100], result[200];
    int pos, len;

    // a) Length
    printf("Enter a string: ");
    gets(str1);
    printf("Length: %d\n", stringLength(str1));

    // b) Concatenation
    printf("\nEnter another string to concatenate: ");
    gets(str2);
    stringConcat(str1, str2, result);
    printf("Concatenated string: %s\n", result);

    // c) Comparison
    int cmp = stringCompare(str1, str2);
    if (cmp == 0)
        printf("\nStrings are equal.\n");
    else if (cmp < 0)
        printf("\nFirst string is smaller.\n");
    else
        printf("\nFirst string is greater.\n");

    // d) Insert substring
    printf("\nEnter substring to insert: ");
    gets(str2);
    printf("Enter position to insert: ");
    scanf("%d", &pos);
    getchar(); // consume newline
    insertSubstring(str1, str2, pos, result);
    printf("After insertion: %s\n", result);

    // e) Delete substring
    printf("\nEnter position to delete from: ");
    scanf("%d", &pos);
    printf("Enter length of substring to delete: ");
    scanf("%d", &len);
    deleteSubstring(str1, pos, len, result);
    printf("After deletion: %s\n", result);

    return 0;
}
