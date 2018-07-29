// Lab 1.1 Show menu.c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <string.h>

#define MAX_SIZE 101
#define SWAP(x,y,t) ((t) = (x), (x) = (y), (y)=(t))
#define MAX_TERMS 100
#define MAX_STACK_SIZE 100
#define MAX_ELEMENTS 200
#define HEAP_FULL(n) (n == MAX_ELEMENTS-1)
#define HEAP_EMPTY(n) (!n)

typedef struct polynomial
{
		int coef;
		int expon;
};
typedef enum { lparen, rparen, plus, minus, times, divide, mod, eos, operand, space} precedence;

typedef struct polyNode * polyPointer;
typedef struct polyNode {
	int coef;
	int expon;
	polyPointer link;
};
typedef struct {
	int key;
}element;
element heap[MAX_ELEMENTS];

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

char output_expr[100];
char expr[100];		
int stack[MAX_STACK_SIZE];	
int top = -1;

void postfix_main();
void postfix();
void printTokenToString(int);
void addchartostring(char sym);
int eval();
precedence getToken(char *symbol, int *n);
void push(int item);
int pop();
// lab infix to postfix conversion
void convertpostfix();
void postfix();
void printTokenToString(int);
void addchartostring(char sym);
char output_expr[100];

polyPointer a,b;
void linkedpolynomialadd_main();
void insertnode(polyPointer * ptr);
void deletenode(polyPointer *ptr);
polyPointer lpadd(polyPointer a, polyPointer b);
void lattach(int coef, int expon, polyPointer *ptr);
void printList(polyPointer ptr);

void maxheap_main();
void printheap(int n);
void pushheap(element item, int *n);
int checkoverlap(int key, int n);
element popheap(int *n);
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

   case 6: postfix_main();
	break;

   case 7: linkedpolynomialadd_main();
	break;

   case 8: maxheap_main();
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
  printf("6. convert infix to postfix\n");
  printf("7. linked polynomial addition\n");
  printf("8. maxheap\n");
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

	printf("startA=%d, finishA=%d\n", starta, finisha );
	printf("startB=%d, finishB=%d\n", startb, finishb );

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

// lab 6. convert infix to postfix, and evaluate the converted postfix using stack
// try this infix :   34 - ( 23 + 231) / 2 
// try your code with example expressions :  123 + ( 43 + 23 * 3 ) / 2
// test your code with several infix expression like the above


void postfix_main()
{
	char expr2[100];
	int result;
	printf("input an infix notation to convert : ");

	fflush(stdin);
	gets(expr2);

	// Q. print expr2
	printf("infix = %s\n\n", expr2);

	strcpy(output_expr,"");
	strcpy(expr,"");

	strcpy(expr, expr2);
	
	// Q. call postfix 
	postfix();
    puts(output_expr);

	strcpy(expr,"");
	strcpy(expr, output_expr);
    
	// Q. call eval() and assign its return value into result  
	result = eval();

	// Q. print output_expr and result
	
	
   printf("\nevaluation of ");
   printf(expr);
   printf(" = %d\n",result);
   printf("\n\n");
}



void printTokenToString(int token)
{
	char sym;

	switch(token) {
	
		case lparen : sym = '(';
			break;
		case rparen : sym = ')';
			break;
		case plus   : sym = '+';
			break;
		case minus  : sym = '-';
			break;
		case times  : sym = '*';
			break;
		case divide : sym = '/';
			break;
		case mod    : sym = '%';
			break;
		case space  : sym = ' ';
			break;
		case eos    : sym = ' ';
			break;					
	}

	// [Q] attach space(' ') to output_expr by addchartostring()
	addchartostring(' ');
    // [Q] attach sym to output_expr by addchartostring()
	addchartostring(sym);
}

void addchartostring(char sym)
{
	// attach the sym after output_expr
	// get the length of output_expr and add sym and '\0' from upperbound index of output_expr

	int len = strlen(output_expr);

	output_expr[len] = sym;
	output_expr[len+1]='\0';
	
}

void push(int item)
{
	if (top >=MAX_STACK_SIZE-1)
	{
		printf("stack full \n");
		exit(1);

	}
	stack[++top]= item;
}

int pop()
{
	if (top == -1)
	{
		printf("stack empty");
		exit(1);
	}
	return stack[top--];
}


// convert infix to postfix
void postfix()
{
	char symbol;
	precedence token;
	int n=0;	 
	
	int isp[]={ 0,19,12,12,13,13,13,0};
	int icp[]={20,19,12,12,13,13,13,0};
	
	top=0;
	stack[0]=eos;

	printf("Correponding Postfix notation is \n postfix = ");

	for (token = getToken(&symbol, &n); token !=eos; token = getToken(&symbol, &n))
	{
		if (token == operand) {
				addchartostring(symbol);  // [Q] rewrite here; add symbol to output_expr by addchartostring
		}
		else if (token==rparen) {
			while (stack[top] != lparen)
				printTokenToString(pop());      // [Q] rewrite here; convert and add token to output_expr by printtokentostring
			pop();
		}
		else if (token != space){ //[Q] write a condition for this block             ) {
			while (isp[stack[top]] >=icp[token])
				printTokenToString(pop());    // [Q] rewrite here; convert and add token to output_expr by printtokentostring
			addchartostring(' ');
			push(token);
		}
	}
    while (top != 0)
       printTokenToString(pop()); 
}

precedence getToken(char *symbol, int *n)
{
	*symbol = expr[(*n)++];

	switch(*symbol) {
		case '(' : return lparen;
		case ')' : return rparen;
		case '+' : return plus;
		case '-' : return minus;
		case '*' : return times;
		case '/' : return divide;
		case '%' : return mod;
		case ' ' : return space;
		case '\0' : return eos;
		default : return operand;
	}
}

int eval()
{
	precedence token;
	char symbol;
	int op1, op2;
	int n=0;
	int digit =0;
	int state =0;	// 0 = space entered after reading operator; 1 = space entered after reading digits

	top = -1;
	token = getToken(&symbol, &n);
	while (token !=eos) {			
			
		if (token == operand){
			// [Q] push token into stack after converting to integer
			// allow to use multiple-digit numbers like 32, 245 as token
			// assume that space exists between tokens, don't push it into stack, discard it.
			// try your code with example expressions " 3 5 * 4  - " 
			// try your code with example expressions " 3 25 * 142  - " 			
			digit = digit*10 + (symbol-'0');
			state = 1;
		}
		// if token is space, there are two cases as follows, do something for each case
		else if (state==1 && token == space){
			push(digit);
			state = 0;
			digit = 0;
			// [Q] if token is space after reading an operand (digit)
		}
		else if (state == 0 && token == space)	 
		{
			// [Q] if token is space after reading an operator (non-digit)
					
		}

		else {
			op2 = pop();
			op1 = pop();
			switch(token) {
			case plus : push(op1+op2);
				break;
			case minus : push(op1-op2);
				break;
			case times : push(op1*op2);
				break;
			case divide : push(op1/op2);
				break;
			case mod : push(op1%op2);
			}
		}
		token = getToken(&symbol, &n);
	}
	return pop();
}



void linkedpolynomialadd_main()
{

	polyPointer temp, c; 
		
	int ans =1;
	
    printf("1. Insert a node to poly A in sorted order\n");
	printf("2. Delete a node from poly A\n");
	printf("3. Insert a node to poly B\n");
	printf("4. Delete a node to poly B\n");
	printf("5. Addition of Poly A and poly B\n");
	
	printf("make your choice (1 ~ 5)\n");

	scanf("%d", &ans);
	
	while (ans >=1 && ans <=5)
	{
		switch(ans)
		{
			case 1: //insertnode(  );
				insertnode(&a);
				break;
			case 2: //deletenode(  );
				deletenode(&a);
				break;
			case 3: //insertnode(  );
				insertnode(&b);
				break;
			case 4: //deletenode(  );
				deletenode(&b);
				 break;
			case 5: //lpadd
				c=lpadd(a,b); 
				printf("List A : ================================\n");	
				printList(a);
				printf("List B : ================================\n");	
				printList(b);
				printf("List C : ================================\n");	
				printList(c);
				break;
		}
		printf("1. Insert a node to poly A\n");
		printf("2. Delete a node from poly A\n");
		printf("3. Insert a node to poly B\n");
		printf("4. Delete a node to poly B\n");
		printf("5. Addition of Poly A and poly B\n");

		printf("make your choice (1 ~ 5)\n");

		scanf("%d", &ans);
	}
}


void insertnode(polyPointer *ptr)
{

		polyPointer rear, temp;
		int coef, expon;

		printf("\n input coef and exp for a term (coef exp)");

		scanf("%d %d",&coef, &expon);

		temp = (polyPointer) malloc(sizeof(struct polyNode));

		// [Q] assign coef and expon values to temp 
		temp->coef = coef;
		temp->expon = expon;
		temp->link = NULL;
		
		// [Q] rear is assigned *ptr to share the location
		rear = *ptr;

		if (rear)
		{
			// find the last node using rear in while 
		while(rear->link != NULL)
			rear = rear->link;
		    rear->link = temp;
		}
		else
			// [Q] temp is the first node when rear is NULL
			*ptr = temp;

		printf("List a : ================================\n");	
		printList(*ptr);

}

void deletenode(polyPointer *ptr)
{

	polyPointer prev, temp;
	int expon;
	
	if (*ptr==NULL)
	{
		printf("no node to delete\n");
		return;
	}

	printf("input an exponent to delete \n");
	scanf("%d", &expon);

	temp = *ptr;
	prev = NULL;

	// find the node with the expon using temp
	while (temp)
	{
		if (temp->expon == expon)
			break;
		prev = temp;
		temp=temp->link;
	}

	if (temp==NULL)
	{
		printf("Such node is not found\n");
		return;
	}

	if (prev==NULL)
	{
		(*ptr) = temp->link;
	}
	else 
	{
		prev->link = temp->link;
	}
	free(temp);

	printf("List : ================================\n");	
	printList(*ptr);
}

polyPointer lpadd(polyPointer a, polyPointer b)
{
	polyPointer c, rear, temp;
	int sum;
	rear = (polyPointer)malloc(sizeof(*rear));
	c= rear;
	while (a && b)
		switch(COMPARE(a->expon, b->expon)) {
		case -1 : lattach(b->coef, b->expon, &rear);
			b = b->link;
			break;
		case 0 : sum = a->coef + b->coef;
			if (sum) lattach(sum, a->expon, &rear);
			a=a->link; b= b->link;
			break;
		case 1 : lattach(a->coef, a->expon, &rear);
			a=a->link;
			break;
		}
	for (; a; a=a->link)
		lattach(a->coef, a->expon, &rear);
	for (; b; b=b->link)
		lattach(b->coef, b->expon, &rear);
	rear->link = NULL;
	temp = c; 
	c=c->link; 
	free(temp);
	return c;
}

void lattach(int coef, int expon, polyPointer *ptr)
{
	polyPointer temp;

	//MALLOC(temp, sizeof(*temp));
	temp = (polyPointer)malloc(sizeof(struct polyNode));

	temp->coef = coef;
	temp->expon = expon;
	(*ptr)->link = temp;
	*ptr = temp;
}


void printList(polyPointer ptr)
{
	// codes for printing a list
	polyPointer temp = ptr;
	
	printf("\n Coef  : ");
	for ( ; temp; temp = temp->link)
	{
		printf("%3d ", temp->coef);
	}

	temp = ptr;
	printf("\n Expon : ");
	for ( ;  temp; temp = temp->link)
	{
		printf("%3d ", temp->expon);
	}
	
	printf("\n\n");
}



void maxheap_main()
{

	int n=0, key, i;

	element item, temp;

	printf("input a number to push into Heap (999 to exit)  => ");
	scanf("%d", &key);

	while (key != 999)
	{
		item.key = key;
		pushheap(item, &n);// [Q] push an item (key) into heap
		printheap(n);// [Q] print the updated max heap 

		do {
			printf("\ninput a number to push into Heap (999 to exit)  => ");
			scanf("%d", &key);// [Q] get another item to insert by scanf with checking overlapping with heap nodes
		}
		while (checkoverlap(key, n)==1);
	}


	
	printf("\n ===== Sorted max heap elements ==============\n");
		
	temp = popheap(&n);
		
	while (n > 0)
	{
	printf("[%d] ",temp.key);//[Q] print desendingly sorted max heap elements
	temp = popheap(&n);//[Q] repeat to delete the root using popheap() and rebuild the heap until it becomes empty
	}
	printf("[%d] ",temp.key);
	printf("\n");
	
}

int checkoverlap(int key, int n)
{
	int i; 

	for (i=1 ; i<=n; i++)
	{
		if (key==heap[i].key)
		{
			// compare key with the root first and move on to the next using loop
			return 1;// return 1 if it overlaps with existing heap nodes
	
		}	
	
	}
	return 0; // if not overlapped return 0

}


void printheap(int n)
{
	int i, count=1;

	printf("\n--- heap ------\n");
	
	for (i = 1 ; i<=n; i++) 
	{
		printf("[%d]  ",heap[i].key);  // [Q] print out the contents of heap in tree shape
		
		if (i==2*count-1){// after printing all nodes of single level, move to the next level
			printf("\n");
			count=count*2;
		}
	}
}

void pushheap(element item, int *n)
{
	int i;
	if (HEAP_FULL(*n)) {
		fprintf(stderr, "The heap is full.\n");
		exit(1);
	}
	i = ++(*n);
	while ((i !=1) && (item.key > heap[i/2].key)) {
		heap[i] = heap[i/2];
		i/=2;
	}
	heap[i] = item;
}


element popheap(int *n)
{
	int parent, child;
	element item, temp, item2;
	item2.key =999;
	

	if (HEAP_EMPTY(*n)) 
		return item2;

	item = heap[1];
	temp = heap[(*n)--];
	parent = 1;
	child = 2;
	while (child <=*n) {
		if ((child <*n) && (heap[child].key < heap[child+1].key))
			child ++;
		if (temp.key >=heap[child].key) break;
		heap[parent] = heap[child];
		parent = child ;
		child *=2;
	}
	heap[parent] = temp;
	return item;
}