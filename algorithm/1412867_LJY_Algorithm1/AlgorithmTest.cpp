#include <iostream>
#include <math.h>
#include <stdlib.h>
#include <string.h>
using namespace std;
#define swap(a,b,c) (c)=(a),(a)=(b),(b)=(c)

void exchangeSort(int arr[]);
void mergeSort(int arr[], int low, int high);
void Merge(int arr[], int low, int mid, int high);
void Merge_main(int arr[]);
int partition(int arr[], int m, int p);
void quickSort(int arr[], int c, int d);
void Quick_main(int arr[]);

int test[20][10];
int comp[3];
int ans[10];

int main() {

	for (int i = 0; i<20; i++)
		for (int j = 0; j<10; j++)
			cin >> test[i][j];


	for (int i = 0; i<20; i++) {
		exchangeSort(test[i]);
		Merge_main(test[i]);
		Quick_main(test[i]);
	}
	cout << "\nAverage # of comparisons for Exchange Sort : " << comp[0] / 20;
	cout << "\nAverage # of comparisons for Merge Sort : " << comp[1] / 20;
	cout << "\nAverage # of comparisons for Quick Sort : " << comp[2] / 20 << "\n";
}

void exchangeSort(int arr[]) {

	int temp, len = sizeof(ans) / 4;

	for (int i = 0; i<len; i++)
		ans[i] = *(arr + i);

	for (int i = 0; i<len - 1; i++) {
		for (int j = i + 1; j<len; j++) {
			comp[0]++;
			if (ans[i]>ans[j]) 
				swap(ans[i], ans[j], temp);
		}
	}
}

void Merge_main(int arr[]) {
	int tmp[10];
	for (int i = 0; i<10; i++)
		tmp[i] = *(arr + i);
	mergeSort(tmp, 0, 9);
}

void mergeSort(int arr[], int low, int high) {
	int mid;

	if (low<high) {
		mid = (low + high) / 2;
		mergeSort(arr, low, mid);
		mergeSort(arr, mid + 1, high);
		Merge(arr, low, mid, high);
	}
}

void Merge(int arr[], int low, int mid, int high) {
	int h = low;
	int i = low;
	int j = mid + 1;

	while (h <= mid && j <= high) {
		comp[1]++;
		if (arr[h] <= arr[j]) {
			ans[i] = arr[h];
			h++;
		}
		else {
			ans[i] = arr[j];
			j++;
		}
		i++;
	}

	if (h>mid) {
		for (int k = j; k <= high; k++) {
			ans[i++] = arr[k];

		}
	}

	else {
		for (int k = h; k <= mid; k++) {
			ans[i++] = arr[k];
		}
	}

	for (int k = low; k <= high; k++) {
		arr[k] = ans[k];
	}
}


void Quick_main(int arr[]) {
	int tmp[10];
	for (int i = 0; i<10; i++)
		tmp[i] = *(arr + i);
	quickSort(tmp, 0, 9);
}

int partition(int arr[], int low, int high) {
	int pivot = arr[low];
	
	do {
		while (low < high && arr[high] >= pivot) {
			high--;
			comp[2]++;
		}
		if (low < high) {
			arr[low] = arr[high];

			while (low < high && arr[low] <= pivot) {
				low++;
				comp[2]++;
			}
			if (low < high) {
				arr[high] = arr[low];
			}
		}
	} while (low < high);
	arr[low] = pivot;

	return low;
}


void quickSort(int arr[], int low, int high) {
	if (low < high) {
		int mid = partition(arr, low, high);
		quickSort(arr, low, mid - 1);
		quickSort(arr, mid + 1, high);
	}
}

