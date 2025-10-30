#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char name[50];
    int rollNo;
    char grade;
} Student;

void readStudents(Student students[], int n) {
    for (int i = 0; i < n; i++) {
        printf("\nEnter details for student %d:\n", i + 1);
        printf("Name: ");
        scanf(" %[^\n]", students[i].name);
        printf("Roll Number: ");
        scanf("%d", &students[i].rollNo);
        printf("Grade: ");
        scanf(" %c", &students[i].grade);
    }
}

void displayStudents(Student students[], int n) {
    printf("\n%-20s %-10s %-10s\n", "Name", "Roll No", "Grade");
    for (int i = 0; i < n; i++) {
        printf("%-20s %-10d %-10c\n", students[i].name, students[i].rollNo, students[i].grade);
    }
}

void sortStudentsByRoll(Student students[], int n) {
    Student temp;
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (students[j].rollNo > students[j + 1].rollNo) {
                temp = students[j];
                students[j] = students[j + 1];
                students[j + 1] = temp;
            }
        }
    }
}

int main() {
    int n;
    Student* students;

    printf("Enter number of students: ");
    scanf("%d", &n);

    students = (Student*)malloc(n * sizeof(Student));
    if (students == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    readStudents(students, n);

    printf("Student Information Before Sorting");
    displayStudents(students, n);

    sortStudentsByRoll(students, n);

    printf("Student Information After Sorting by Roll Number");
    displayStudents(students, n);

    free(students);

    return 0;
}
