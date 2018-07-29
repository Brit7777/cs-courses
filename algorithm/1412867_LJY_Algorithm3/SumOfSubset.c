#include <stdio.h>
#include <math.h>

int d;

void subset(int n, int w[], int d)
{
	int i;
	int s = 0;
	int x[100]; // tracking of values in array w
	int v = 0;
	int total=0;
	for (i = 1; i <= n; i++)
		x[i] = 0;

	int k = 1;
	x[k] = 1;
	++v;



	while (1)
	{
		if (k <= n && x[k] == 1)
		{
			if (s + w[k] == d) // soln found
			{
				for (i = 1; i <= n; i++)
				{

					printf("%d ", x[i]);

				}
				printf("\n");

				x[k] = 0;
				++v;
				

			}
			else if (s + w[k] < d)   //soln 찾을 가능성 있을 때
			{
				s += w[k];
			}
			else
			{
				x[k] = 0;
				++v;
			}
		}
		else
		{
			k--;
			while (k > 0 && x[k] == 0)
			{
				k--;
			}

			if (k == 0)
				break;

			x[k] = 0;
			++v;
			s = s - w[k];
		}
		k += 1;
		x[k] = 1;
		++v;
	}
	//total nodes 
	for (int i = 0; i <= n; i++) 
		total += (int)pow((double)2, (double)i);
	
	//출력	
	printf("%d, %d, %.2f\n", v, total, (double)v/total);
}


int main()
{
	void subset(int n, int w[], int d);
	int sum = 0, i, n;
	int w[100];
	//node 수 입력받기
	scanf("%d", &n);
	//weight 입력받기
	for (i = 1; i <= n; i++)
		scanf("%d", &w[i]);
	//합 입력
	scanf("%d", &d);
	for (i = 1; i <= n; i++)
		sum += w[i];
	if (sum < d)
	{
		printf("no solution exists\n");

	}
	printf("-----------------\n");

	subset(n, w, d);
	return 0;

}