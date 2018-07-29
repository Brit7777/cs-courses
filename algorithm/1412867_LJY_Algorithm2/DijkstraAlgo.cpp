#include <stdio.h>
#include <iostream> // std::cout을 제공
using namespace std;
#define N 100




int a[N + 1][N + 1] = { 0 };
int visit[N + 1];
int dist[N + 1] = { -1 };
int p[N + 1] = { 0 };
int temp[N + 1] = { 0 };
int start = 0;
int end_num = 0;
int result[N + 1] = { 0 };
int n;
int v;





int main() {
	void input();
	void dijkstra();
	void output();

	int i, j;
	input();
	cout << "dist(v):" << endl;
	dijkstra();
	cout << "P(v):" << endl;
	output();
	return 0;
}


void input() {
	int i = 0;
	int j = 0;
	int from = 0;
	int to = 0;
	cin >> n;
	
	// 각 정점으로 가는 간선의 가중치를 받기
	for (i = 1; i <= n; i++)
		for (j = 1; j <= n; j++)
			cin >> a[i][j];
	cin >> start;
	cin >> end_num;
}

void dijkstra()
{
	int i, j, z;
	int min = 0;
	int x;

	v = start;

	visit[v] = true;

	for (j = 1; j <= n; j++) {    //초기화
		dist[j] = -1;
		dist[start] = 0;
		cout << dist[j] << " ";
	}
	result[1] = v;
	cout << "," << v << endl;


	for (i = 2; i <= n; i++) {
		for (j = 1; j <= n; j++) {
			if (visit[j] != true || dist[j] == -1) {  //안 지나갔거나 한번도 안바뀌었을 때
				if (dist[j] < 0) {  //안 지나갔고 한번도 바뀌지 않았을 때
					if (dist[j] <= dist[v] + a[v][j]) {
						dist[j] = dist[v] + a[v][j];
						temp[j] = dist[j];
						min = temp[j];
						x = j;
					}   //연결된 노드 없을 때
					else temp[j] = 0;   
				}
				else {   //안 지나갔는데 이미 한번 바꼈을 때
					temp[j] = dist[j];
					min = temp[j];
					x = j;
				}
			}
			else  //지나갔고 이미 처리되었을 때
				temp[j] = 0;

			cout << dist[j] << " ";
			
		}
		for (z = 1; z <= n; z++) {
			if (temp[z] != 0) {
				if (temp[z] >= min)
					v = x;
				else
					v = z;
			}
		}

		
		visit[v] = true; // 가장 가까운 정점으로 방문, i정점에서 가장 가까운 최단경로 v


		result[i] = v;
		cout << "," << v << endl;

	}

}





void output() {
	int i=1;
	cout << "Shortest Path: " << endl;
	cout << result[i];
	for (i=2;i<=n;i++){
		cout<< "-";
		if (a[result[i-1]][result[i]] == -1)
			continue;
		cout << result[i];
		}
	
	cout << "," << dist[end_num];
	cout << '\n';
}


