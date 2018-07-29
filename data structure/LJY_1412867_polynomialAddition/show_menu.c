// Lab 1.1 Show menu.c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define MAX_SIZE 101
#define SWAP(x,y,t) ((t) = (x), (x) = (y), (y)=(t))
#define MAX_TERMS 100

typedef struct polynomial
{
		int coef;
		int expon;
};
struct polynomial terms[MAX_TERMS];

int avail=0;
int show_menu();
long long factorial(int);
void factorial_main();
int primenumber(int);
void primenumber_main();
void selectionsort(int number[], int n);
int binsearch(int list[], int searchnum, int left, int right);
int rbinsearch(int list[], int searchnum, int left, int right);
void binarynumber_main();
int count;
void perm(char list[], int i, int n);
int count=0, start, end;
void permutation_main();
void attach(int coefficient, int exponent);
void padd(int startA, int finishA, int startB, int finishB, int * startD, int * finishD);
void printpoly(int startA, int finishA, int startB, int finishB);
void polynomialadd_main();

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

   case 3: binarynumber_main();
    break;

   case 4: permutation_main();
	break;

   case 5: polynomialadd_main();
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
  printf("3. Binary search\n");
  printf("4. permutation\n");
  printf("5. polynomial addition\n");
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
 for (i=2 ; i<= maxnum; i++) {
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

void binarynumber_main() {
 int i, n, min_rand, max_rand;
 int number[MAX_SIZE];
 int searchnum, pos, method;
 
 printf("Enter # of integers to generate:");

 scanf_s("%d",&n);

 if (n<1 || n > MAX_SIZE) {
  fprintf(stderr, "Improper value of n\n");
  exit(1);
 }
 srand((unsigned int) time(0));

 printf("Enter Min bound of random numbers:");
 scanf("%d", &min_rand);   // Q

 printf("Enter Max bound of random numbers:");
 scanf("%d", &max_rand);   // Q

 for(i=0;i<n;i++)
 {
  number[i] = rand() % ((max_rand - min_rand)+1)+min_rand; // generate integers between min and max : 
  printf("%d ", number[i]); 
 }
 
 selectionsort(number, n); // array and array size

 printf("\n Sorted array \n");

 for (i=0; i< n ; i++)
  printf("%d ", number[i]);
 printf("\n");
  
 printf("\n Enter the number to search : ");
 scanf_s("%d",&searchnum); 
 
 count = 0;
 pos = binsearch(number,searchnum,0,n-1); 

 printf("# of iterations %d\n",count);
 printf("the key is stored in %d\n", pos+1);

 count = 0;
 pos = rbinsearch(number,searchnum,0,n-1); 

 printf("# of recursive calls %d\n",count);
 printf("the key is stored in %d\n",pos+1);
  

}


void selectionsort(int number[], int n)
{
 
 int i, j, min, temp;
 for (i=0; i<n-1; i++) {  // Q) Fill here with selection sort code 
  min = i;         
  for (j=i;j<n;j++) {
   if (number[min]>number[j])
       min = j;
  }
   temp = number[min];
   number[min] = number[i];
   number[i] = temp;
 }
}


int binsearch(int list[], int searchnum, int left, int right)
{
 int mid;
 while(left<=right) {
  mid = (left+right)/2;
  count++;
  if (searchnum<list[mid]) 
	  right=mid-1;
  else if (searchnum == list[mid]) 
	  return mid;
  else left = mid+1;
 }
 return -1;
}

int rbinsearch(int list[], int searchnum, int left, int right)
{
 int mid;
 if (left<=right){
  mid = (left+right)/2;
  count++;
  if (list[mid] > searchnum)
	return rbinsearch(list, searchnum, left, mid-1);
  else if (list[mid]<searchnum)
	return rbinsearch(list, searchnum, mid+1, right);
  else
	return mid;
 }
 return -1;
}

void permutation_main(void)
{
	char list[]={'A','B','C','D','E'}; 

	printf("input two values for start and end positions : ");
	scanf("%d %d", &start, &end);

	while (start !=-1)
	{
		// write single or multiple statement for each queation if needed.

		perm(list, start, end);
		count = 0;
   		// (1) call permutation function here 
		printf("\n");
		printf("input two values for start and end positions : ");
	    scanf("%d %d", &start, &end);
		// (2) receive start and end indices of the range to generate permutations by scanf()
		
	}
}

void perm(char list[], int i, int n)
{
	int j, temp; 

	if (i==n)
	{
		count++;
		printf("[  %3d] ",count);
		for (j=start;j<=n;j++) 
			printf("%c", list[j]);
		
		printf("   ");
		
		if (count%5 == 0)
			printf("\n");
		
		// (3) attach serial no. to each permutation 

		// (4) print each permutation one by one by printing out char element
					
		// (5) print out the permutation set in table form  
						
	}
	else {
		for (j=i; j<=n; j++)
		{
			SWAP(list[i], list[j], temp);
			perm(list, i+1, n);
			SWAP(list[i], list[j], temp);
		}
	}
}

void polynomialadd_main()
{
	int starta=-1, finisha=-1;
	int startb=-1, finishb=-1;
	int startd=-1, finishd=-1;

	int coef, expon;

	int ans =1;
	int old_expon=9999;

	avail=0;
	starta=0;
	
	// input for polynomial A
	while (ans !=0)
	{
	
		printf("\n input a term of polynomial A (coef exp) (exit = -1 -1)");
		printf("\n the exponent should be lower than the former one");
		// (Q1) receive coef and exponent value of single term of polynomial by scanf() in exponent decreaing order
		scanf("%d %d", &coef, &expon);
		// (Q2)  call attach function to add a temp with coef and expon
		if(coef!=-1 && expon != -1 && old_expon>expon){
		finisha = avail;
		attach( coef, expon );
		printpoly(starta, finisha, startb, finishb);
		old_expon = expon;
		}
		else if (old_expon<=expon)
			printf("\n the exponent should be lower than the former one\n");
		else if (coef==-1 && expon == -1)
			break;
	}
		
	ans=1;	

	startb= avail;
	old_expon=9999;
	
	// input for polynomial B
	while (ans !=0)
	{
	
		printf("\n input a term of polynomial B (coef exp) (exit = -1 -1)");
		printf("\n The exponent should be lower than the former one\t");
		// (Q3) receive coef and exponent value of single term of polynomial by scanf() in exponent decreaing order
		scanf("%d %d",&coef, &expon); 
		// (Q4)  call attach function to add a temp with coef and expon
		if(coef!=-1 && expon != -1 && old_expon>expon){
		finishb = avail;
		attach( coef, expon );
		printpoly(starta, finisha, startb, finishb);
		old_expon = expon;
		}
		else if (old_expon<=expon)
			printf("\n the exponent should be lower than the former one\n");
		else if (coef==-1 && expon == -1)
			break;
	}

	// (Q5) call padd() with 6 parameters
	padd(starta, finisha, startb, finishb, &startd, &finishd);
	// (Q6) print startd, finishd values
	printf("startD=%d, finishD=%d\n", startd, finishd );
	printpoly(starta, finisha, startb, finishb);

}


int COMPARE(int a, int b)
{
	if (a < b ) return -1;
	else if (a == b) return 0;
		else return 1;
}

void printpoly(int starta, int finisha, int startb, int finishb )
{
	int i;

	// (q7) print starta, finisha, startb, finishb values
	printf("startA=%d, finishA=%d\n", starta, finisha );
	printf("startB=%d, finishB=%d\n", startb, finishb );

	// (Q8) draw a table to print array contents with polynomial terms
		printf("\n index:\t");
	for( i=0;i<avail; i++)
		printf("%d\t", i);
	printf("\n ----------------------------------------------------------------------------\n");
	printf(" coef:\t");
	for( i=0;i<avail; i++)
		printf("%d\t", terms[i].coef);
	printf("\n expon:\t");
	for( i=0;i<avail; i++)
		printf("%d\t", terms[i].expon);
	printf("\n\n");


}

void padd(int startA, int finishA, int startB, int finishB, int * startD, int * finishD)
{
	int coefficient;
	*startD = avail;

	while (startA <=finishA && startB <=finishB)
	{
		switch(COMPARE(terms[startA].expon, terms[startB].expon))
		{
		case -1 : attach(terms[startB].coef, terms[startB].expon);
			startB++;
			break;

		case 0 : coefficient = terms[startA].coef + terms[startB].coef;
				if (coefficient) 
					attach(coefficient, terms[startA].expon);
				startA++; 
				startB++;
				break;

		case 1 : attach(terms[startA].coef, terms[startA].expon);
			startA++;
			break;
		}
	}

	for (; startA<=finishA; startA++)
		attach(terms[startA].coef, terms[startA].expon);

	for (; startB<=finishB; startB++)
		attach(terms[startB].coef, terms[startB].expon);
	*finishD = avail-1;
}

void attach(int coefficient, int exponent)
{
	if (avail >=MAX_TERMS) {
		exit(1);
	}
	terms[avail].coef = coefficient;
	terms[avail++].expon = exponent;

}
