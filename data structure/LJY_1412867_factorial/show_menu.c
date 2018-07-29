// Lab 1.1 Show menu.c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int show_menu();
long long factorial(int);
void factorial_main();
int primenumber(int);
void primenumber_main();

// main()---------------------------------------------------------------

void main(void)
{

	int ans;
		
	ans = show_menu();

	while (ans!=0)
	{
		switch(ans)
		{
			case 1: factorial_main();
				break;
			
			case 2: primenumber_main();
				break;

			default : printf("invalid no !");
				break;
		}
		
		ans = show_menu();
	}
	printf("\nGood bye\n");

}

int show_menu()
{
		int ans;
		
		printf("1. Factorial\n");
		printf("2. Prime Number\n");
		printf("3. Selection sort\n");
		printf("4. Binary search\n");
		printf("0. Exit\n");
		printf("\nMake your choice (0 ~ 10, 0 = exit) => ");
		scanf_s("%d", &ans);
		printf("\n\n");
		return ans;
			
}




void factorial_main()
{
	long long result;
	int i,n;
	printf("Give a max number\n");
	scanf("%d", &n);
	for (i=0; i<=n;i++)
	{
		result = factorial(i);
		printf("%d ! = %lld \n",i, result);
	}
	printf("give an integer to calculate the factorial.\n");
	scanf("%d", &n);
	printf("%d ! = %lld \n",n, factorial(n));
	printf("\n");
}



long long factorial(int n) {
	if (n==0) 
		return 1;
	else 
		return n*factorial(n-1);
}





void primenumber_main() {
	int maxnum = 100;
	int prime, num;
	int i,j;
	printf("give an integer.\n");
	scanf("%d", &maxnum);
	// get a maxnum using scanf_s()
	// list only prime numbers between 2 and maxnum
	for (i=2 ; i<= maxnum; i++)	{
		prime = primenumber(i);
		if (prime == 1)
			printf("%d   ", i);
		// (Q1) if it is prime , print it
	    }
	printf("\n Give a number to check : ");
	scanf_s("%d", &num);
	// get a number from user using scanf_s
	//(Q2) scanf_s(              );	
	prime = primenumber(num);
	if (prime == 1)          // if num is prime
		printf("%d is a prime number\n",num);
	else
		printf("%d is not a prime number\n",num);
}

int primenumber(int num)
{
	int j;
	// write a loop for checking if num is prime or not
	if (num < 10) {
	   if (num == 2 || num == 3 || num == 5 || num == 7)
		 return 1;
	}

	else {
		for (j = 2; j < num; j++) {
            if (num % j == 0) 
                return 0;
			}
		if (j = num)
			return 1;
	
}
}