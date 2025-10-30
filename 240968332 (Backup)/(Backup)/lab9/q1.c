#include <stdio.h>
#include <stdlib.h>

// Node structure
typedef struct Node {
    int data;
    struct Node *left, *right;
} Node;

// Stack structure for iterative traversals
typedef struct Stack {
    Node* items[100];
    int top;
} Stack;

// Stack operations
void initStack(Stack* s) { s->top = -1; }
int isEmpty(Stack* s) { return s->top == -1; }
void push(Stack* s, Node* node) { s->items[++s->top] = node; }
Node* pop(Stack* s) { return s->items[s->top--]; }
Node* peek(Stack* s) { return s->items[s->top]; }

// Create a new node
Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// 1. Inorder Traversal (Iterative)
void inorderTraversal(Node* root) {
    Stack s;
    initStack(&s);
    Node* current = root;
    while (!isEmpty(&s) || current) {
        while (current) {
            push(&s, current);
            current = current->left;
        }
        current = pop(&s);
        printf("%d ", current->data);
        current = current->right;
    }
}

// 2. Postorder Traversal (Iterative)
void postorderTraversal(Node* root) {
    if (!root) return;
    Stack s1, s2;
    initStack(&s1);
    initStack(&s2);
    push(&s1, root);
    while (!isEmpty(&s1)) {
        Node* temp = pop(&s1);
        push(&s2, temp);
        if (temp->left) push(&s1, temp->left);
        if (temp->right) push(&s1, temp->right);
    }
    while (!isEmpty(&s2)) {
        printf("%d ", pop(&s2)->data);
    }
}

// 3. Preorder Traversal (Iterative)
void preorderTraversal(Node* root) {
    if (!root) return;
    Stack s;
    initStack(&s);
    push(&s, root);
    while (!isEmpty(&s)) {
        Node* temp = pop(&s);
        printf("%d ", temp->data);
        if (temp->right) push(&s, temp->right);
        if (temp->left) push(&s, temp->left);
    }
}

// 4. Print Parent of a Given Element
void printParent(Node* root, int key, Node* parent) {
    if (!root) return;
    if (root->data == key) {
        if (parent)
            printf("Parent of %d is %d\n", key, parent->data);
        else
            printf("%d is the root and has no parent\n", key);
        return;
    }
    printParent(root->left, key, root);
    printParent(root->right, key, root);
}

// 5. Print Depth (Height) of Tree
int getHeight(Node* root) {
    if (!root) return 0;
    int left = getHeight(root->left);
    int right = getHeight(root->right);
    return 1 + (left > right ? left : right);
}

// 6. Print Ancestors of a Given Element
int printAncestors(Node* root, int key) {
    if (!root) return 0;
    if (root->data == key) return 1;
    if (printAncestors(root->left, key) || printAncestors(root->right, key)) {
        printf("%d ", root->data);
        return 1;
    }
    return 0;
}

// 7. Count Leaf Nodes
int countLeafNodes(Node* root) {
    if (!root) return 0;
    if (!root->left && !root->right) return 1;
    return countLeafNodes(root->left) + countLeafNodes(root->right);
}

// Sample usage
int main() {
    Node* root = createNode(1);
    root->left = createNode(2);
    root->right = createNode(3);
    root->left->left = createNode(4);
    root->left->right = createNode(5);
    root->right->right = createNode(6);

    printf("Inorder Traversal: ");
    inorderTraversal(root);
    printf("\nPreorder Traversal: ");
    preorderTraversal(root);
    printf("\nPostorder Traversal: ");
    postorderTraversal(root);

    printf("\n");
    printParent(root, 5, NULL);
    printf("Height of tree: %d\n", getHeight(root));
    printf("Ancestors of 5: ");
    printAncestors(root, 5);
    printf("\nLeaf nodes count: %d\n", countLeafNodes(root));

    return 0;
}
