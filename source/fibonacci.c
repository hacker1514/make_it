#include <stdio.h>

void fibonacci(int n) {
    int first = 0, second = 1, next;

    printf("Fibonacci Series: ");
    for (int i = 0; i < n; i++) {
        if (i <= 1) {
            next = i; // The first two Fibonacci numbers are 0 and 1
        } else {
            next = first + second; // Next number is the sum of the previous two
            first = second; // Update first
            second = next; // Update second
        }
        printf("%d ", next);
    }
    printf("\n");
}

int main() {
    int n;

    printf("Enter the number of terms in the Fibonacci series: ");
    scanf("%d", &n);
fibonacci(n);

    return 0;
}
