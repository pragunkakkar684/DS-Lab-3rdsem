#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int vertex;
    struct Node* next;
} Node;

Node* createNode(int v) {
    Node* n = malloc(sizeof(Node));
    n->vertex = v; n->next = NULL;
    return n;
}

void addEdge(Node* adj[], int src, int dest, int directed) {
    Node* n = createNode(dest);
    n->next = adj[src]; adj[src] = n;
    if (!directed) {
        n = createNode(src);
        n->next = adj[dest]; adj[dest] = n;
    }
}

void printGraph(Node* adj[], int V) {
    for (int i = 0; i < V; i++) {
        printf("%d:", i);
        for (Node* temp = adj[i]; temp; temp = temp->next)
            printf(" %d", temp->vertex);
        printf("\n");
    }
}

int main() {
    int V, E, directed;
    printf("Vertices, Edges, 1=Directed 0=Undirected: ");
    scanf("%d %d %d", &V, &E, &directed);

    Node* adj[V];
    for (int i = 0; i < V; i++) adj[i] = NULL;

    printf("Enter edges (src dest):\n");
    for (int i = 0; i < E; i++) {
        int s, d;
        scanf("%d %d", &s, &d);
        addEdge(adj, s, d, directed);
    }

    printGraph(adj, V);
    return 0;
}
