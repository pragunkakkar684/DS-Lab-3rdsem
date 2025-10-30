#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char name[50];
    int roll_no;
    float marks;
} Student;

void read(Student* s, int n) {
    for (int i = 0; i < n; i++) {
        printf("\nStudent %d\nName: ", i + 1);
        scanf(" %[^\n]", (s + i)->name);
        printf("Roll No: ");
        scanf("%d", &((s + i)->roll_no));
        printf("Marks: ");
        scanf("%f", &((s + i)->marks));
    }
}

void display(Student* s, int n) {
    printf("\n%-20s %-10s %-10s\n", "Name", "Roll No", "Marks");
    for (int i = 0; i < n; i++)
        printf("%-20s %-10d %-10.2f\n", (s + i)->name, (s + i)->roll_no, (s + i)->marks);
}

void topper(Student* s, int n) {
    Student* top = s;
    for (int i = 1; i < n; i++)
        if ((s + i)->marks > top->marks) top = s + i;

    printf("\nTopper:\n%s (Roll No: %d) - %.2f marks\n", top->name, top->roll_no, top->marks);
}

int main() {
    int n;
    printf("Enter number of students: ");
    scanf("%d", &n);

    Student* s = malloc(n * sizeof(Student));
    if (!s) return 1;

    read(s, n);
    display(s, n);
    topper(s, n);

    free(s);
    return 0;
}
