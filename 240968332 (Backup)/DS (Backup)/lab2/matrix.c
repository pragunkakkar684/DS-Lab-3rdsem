#include <stdio.h>
#include <stdlib.h>

int **multiplyMatrices(int **mat1, int r1, int c1, int **mat2, int r2, int c2) {
    if (c1 != r2) {
        printf("Matrix multiplication not possible.\n");
        return NULL;
    }

    int **result = (int **)malloc(r1 * sizeof(int *));
    for (int i = 0; i < r1; i++) {
        *(result + i) = (int *)malloc(c2 * sizeof(int));
    }

    for (int i = 0; i < r1; i++) {
        for (int j = 0; j < c2; j++) {
            *(*(result + i) + j) = 0;
            for (int k = 0; k < c1; k++) {
                *(*(result + i) + j) += (*(*(mat1 + i) + k)) * (*(*(mat2 + k) + j));
            }
        }
    }

    return result;
}

int main() {
    int r1, c1, r2, c2;

    printf("Enter rows and columns for Matrix 1: ");
    scanf("%d %d", &r1, &c1);

    printf("Enter rows and columns for Matrix 2: ");
    scanf("%d %d", &r2, &c2);
    int **mat1 = (int **)malloc(r1 * sizeof(int *));
    int **mat2 = (int **)malloc(r2 * sizeof(int *));
    for (int i = 0; i < r1; i++)
        *(mat1 + i) = (int *)malloc(c1 * sizeof(int));
    for (int i = 0; i < r2; i++)
        *(mat2 + i) = (int *)malloc(c2 * sizeof(int));

    printf("Enter elements of Matrix 1:\n");
    for (int i = 0; i < r1; i++)
        for (int j = 0; j < c1; j++)
            scanf("%d", (*(mat1 + i) + j));

    printf("Enter elements of Matrix 2:\n");
    for (int i = 0; i < r2; i++)
        for (int j = 0; j < c2; j++)
            scanf("%d", (*(mat2 + i) + j));

    printf("\nMatrix 1:\n");
    for (int i = 0; i < r1; i++) {
        for (int j = 0; j < c1; j++)
            printf("%d ", *(*(mat1 + i) + j));
        printf("\n");
    }

    printf("\nMatrix 2:\n");
    for (int i = 0; i < r2; i++) {
        for (int j = 0; j < c2; j++)
            printf("%d ", *(*(mat2 + i) + j));
        printf("\n");
    }

    int **product = multiplyMatrices(mat1, r1, c1, mat2, r2, c2);

    if (product != NULL) {
        printf("\nProduct Matrix:\n");
        for (int i = 0; i < r1; i++) {
            for (int j = 0; j < c2; j++)
                printf("%d ", *(*(product + i) + j));
            printf("\n");
        }

        for (int i = 0; i < r1; i++)
            free(*(product + i));
        free(product);
    }

    for (int i = 0; i < r1; i++)
        free(*(mat1 + i));
    for (int i = 0; i < r2; i++)
        free(*(mat2 + i));
    free(mat1);
    free(mat2);

    return 0;
}
