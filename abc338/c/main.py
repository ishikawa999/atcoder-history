def max_meals(N, Q, A, B):
    dp = [0] * (sum(Q) + 1)  # 各材料の合計量に基づいた配列を用意

    for i in range(N):
        for j in range(sum(Q), -1, -1):
            if j >= A[i]:
                dp[j] = max(dp[j], dp[j - A[i]] + 1)  # 料理Aを作る場合
            if j >= B[i]:
                dp[j] = max(dp[j], dp[j - B[i]] + 1)  # 料理Bを作る場合

    return max(dp)

# 入力を受け取る
N = int(input())
Q = list(map(int, input().split()))
A = list(map(int, input().split()))
B = list(map(int, input().split()))

# 関数を呼び出して結果を表示
print(max_meals(N, Q, A, B))
