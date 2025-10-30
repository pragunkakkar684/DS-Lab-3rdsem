#include <stdio.h>
#include <stdlib.h>

#define MAX 100

int visited[MAX], V;
int queue[MAX], front = 0, rear = 0;

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

void bfs(int start) {
    visited[start] = 1;
    queue[rear++] = start;

    while (front < rear) {
        int curr = queue[front++];
        printf("%d ", curr);
        for (Node* t = adj[curr]; t; t = t->next)
            if (!visited[t->v])
                visited[t->v] = 1, queue[rear++] = t->v;
    }
}

int main() {
    int E, s, d, start;
    scanf("%d %d", &V, &E);
    for (int i = 0; i < E; i++) {
        scanf("%d %d", &s, &d);
        addEdge(s, d); // addEdge(d, s) for undirected
    }
    scanf("%d", &start);
    bfs(start);
    return 0;
}
