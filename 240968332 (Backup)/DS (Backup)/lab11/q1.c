#include <stdio.h>
#include <stdlib.h>

#define MAX_VERTICES 100

void displayMatrix(int matrix[MAX_VERTICES][MAX_VERTICES], int vertices) {
    printf("\nAdjacency Matrix:\n");
    for (int i = 0; i < vertices; i++) {
        for (int j = 0; j < vertices; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int matrix[MAX_VERTICES][MAX_VERTICES] = {0};
    int vertices, edges, choice;

    printf("Enter number of vertices: ");
    scanf("%d", &vertices);

    printf("Enter number of edges: ");
    scanf("%d", &edges);

    printf("Choose graph type:\n");
    printf("1. Directed Graph\n");
    printf("2. Undirected Graph\n");
    printf("Enter your choice (1 or 2): ");
    scanf("%d", &choice);

    printf("Enter edges (format: source destination):\n");
    for (int i = 0; i < edges; i++) {
        int src, dest;
        scanf("%d %d", &src, &dest);

        if (src >= vertices || dest >= vertices || src < 0 || dest < 0) {
            printf("Invalid edge (%d, %d). Vertex index out of range.\n", src, dest);
            continue;
        }

        matrix[src][dest] = 1;
        if (choice == 2) {
            matrix[dest][src] = 1; // For undirected graph
        }
    }

    displayMatrix(matrix, vertices);

    return 0;
}
