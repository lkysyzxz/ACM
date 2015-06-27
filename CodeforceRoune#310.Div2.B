//CodeforceRound#310.Div2.B
//题目大意:有一个齿轮有n个齿，转动第一个会升高或下降一定距离，则第二个就相应下降或升高相同的距离，问最终能否转动成0 1 2 3 ...n-1
//思路：对于这个问题，只需要对每一个齿进行枚举模拟即可
//第一个齿向上转动到0需要的次数 upto ，然后对后面每一个齿进行枚举，判断其转动方向和需要转动的长度是否和upto 相等，不相等说明此次转动失败
//同理，试一下第一个位置向下转动
//两个方向都尝试过以后，两次尝试中有一次为真，则Yes,否则为No.

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
int n;
int num[11111];
int main(){
	cin >> n;
	for (int i = 0; i < n; i++){
		cin >> num[i];
	}
	int upto = n - num[0];
	int downto = num[0] - 0;
	int flagup = true;
	int flagdown = true;
	for (int i = 1; i < n; i++){//first up
		if (i % 2 == 1){
			if (num[i] >= i){
				if (num[i] - i != upto)
					flagup = false;
			}
			else{
				if (n - i + num[i] != upto)
					flagup = false;
			}
		}
		else{
			if (num[i] <= i){
				if (i-num[i] != upto)
					flagup = false;
			}
			else{
				if (n +i - num[i]!= upto)
					flagup = false;
			}
		}
	}

	for (int i = 1; i < n; i++){//first up
		if (i % 2 == 1){
			if (num[i] <= i){
				if (i - num[i] != downto)
					flagdown = false;
			}
			else{
				if (n + i - num[i] != downto)
					flagdown = false;
			}
			
		}
		else{
			if (num[i] >= i){
				if (num[i] - i != downto)
					flagdown = false;
			}
			else{
				if (n - i + num[i] != downto)
					flagdown = false;
			}
		}
	}

	if (flagdown || flagup)
		cout << "Yes" << endl;
	else
		cout << "No" << endl;
	return 0;
}
