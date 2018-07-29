#include<stdio.h>
#include<math.h>

int board[20], counter;
int t = 0;
int getSum(int arr[], int len);
int total_node(int, int);


int main()
{
	int i, l, n, result, len;
	int sum[100000] = { 0 };
	void queen(int row, int n);

	scanf("%d", &n);
	while (n>10 || n<4) {
		printf("new input needed!\n");
		scanf("%d", &n);
	}
	printf("------------\n");
	queen(1, n);
	for (l = 1; l <= n; l++) {
		t = total_node(n, l);
		sum[l] = t;
	}
	result = getSum(sum, n);
	printf("\n%d, %d, %.2f\n", counter, result, (double)counter / result);
	return 0;
}

int getSum(int arr[], int len) {
	int sum = 0;
	int i;
	for (i = 1; i <= len; i++) {
		sum += arr[i]++;
	}
	return sum + 1;
}

int place(int row, int col)
{
	int i;
	for (i = 1; i <= row - 1; ++i)
	{
		counter++;
		if (board[i] == col)
			return 0;
		else
			if (abs(board[i] - col) == abs(i - row))
				return 0;
	}

	return 1; //conflict occurs
}

int total_node(int input, int x)
{
	int output = 1;
	int a;
	int sum[100];
	for (a = 1; a <= x; a++) {
		output *= input;
	}
	return output;
}

void print(int n)
{
	int a, b;


	for (a = 1; a <= n; ++a)
	{
		for (b = 1; b <= n; ++b) 
		{
			if (board[a] == b)
				printf("%d ", b); 
		}

	}
	printf("\n");
}


void queen(int row, int n)
{
	int col;
	for (col = 1; col <= n; ++col)
	{
		if (place(row, col))
		{
			board[row] = col; 
			if (row == n) //dead end
				print(n); 
			else 
				queen(row + 1, n);
		}
	}
}


