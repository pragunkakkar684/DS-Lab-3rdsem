#include <stdio.h>
#include <stdlib.h>

#define MAX 100

int visited[MAX], V;

typedef struct Node {
    int v;
    struct Node* next;
} Node;

Node* adj[MAX];

Node* newNode(int v) {
    Node* n = malloc(sizeof(Node));
    n->v = v; n->next = NULL;
    return n;
}

void addEdge(int s, int d) {
    Node* n = newNode(d);
    n->next = adj[s]; adj[s] = n;
}


void dfs(int v) {
    visited[v] = 1;
    printf("%d ", v);
    for (Node* t = adj[v]; t; t = t->next)
        if (!visited[t->v])
            dfs(t->v);
}

int main() {
    int E, s, d, start;
    scanf("%d %d", &V, &E);
    for (int i = 0; i < E; i++) {
        scanf("%d %d", &s, &d);
        addEdge(s, d); // addEdge(d, s) for undirected
    }
    scanf("%d", &start);
    dfs(start);
    return 0;
}
