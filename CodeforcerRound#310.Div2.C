//CodeforceRound#310.Div2.C
//题目大意:有n个洋娃娃，以及k条链子，
//有两个花费一秒的操作:
//1.把娃娃a套进b中，前提是a没有套接到其他的娃娃中，ｂ没有套接其他娃娃且没有包含其他娃娃
//2.把a与b拆开，前提b没有套接到其他娃娃之中
//问最终把它们连成 1 2 3 4 5 。。。 n需要的时间
#include<iostream>
#include<string>
#include<cstring>
#include<cstdio>
#include<queue>
#include<algorithm>
#include<set>
#include<map>
#include<functional>
using namespace std;
int num[111111];//当前链子中第i个数字
int line[111111];//第i条链子的长度
int Next[111111];//娃娃i的下一个娃娃是多少
/*我们连接的时候，只需要考虑：当前娃娃需要连的是哪个，它连接了哪个，当前娃娃连接了哪个.这些因素决定了我们需要多少时间来连接这个娃娃*/
int main(){
	int n,k;
	cin >> n>>k;
	int ans = 0;
	for (int i = 1; i <= k; i++){
		cin >> line[i];
		for (int j = 1; j <= line[i]; j++){
			cin >> num[j];
			if (j>1){
				Next[num[j - 1]] = num[j];//对出现的数字进行初始化连接
			}
			if (j == line[i]){
				Next[num[j]] = num[j];//结尾标志 Next[i]==i;
			}
		}
	}

	for (int i = 1; i < n; i++){//从1到n-1进行枚举
		if (Next[i] != i + 1){//如果当前娃娃连接的下一个不符合要求，则需要改变
			if (Next[i] != i)//如果当前娃娃有连接下一个（前提已经不符合要求了），则需要一秒来拆解
				ans++;
			Next[i] = i + 1;
			ans++;//连接的时间
			if (Next[i + 1] != i + 1)//如果下一个娃娃是有连接的，则无论是否符合要求，都要拆解
			{
				ans++;//花费1秒
				Next[i + 1] = i + 1;//拆解
			}
		}
	}
	cout << ans << endl;
	return 0;
}
