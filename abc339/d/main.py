N = int(input())
GRID = [input().strip() for _ in range(N)]
DIRECTIONS = [(0, 1), (1, 0), (0, -1), (-1, 0)]
players = []

# プレイヤーの初期位置
for i in range(N):
    for j in range(N):
        if GRID[i][j] == 'P':
            players.append((i, j))

# すでに行ったことがあるマスを記録
visited = set([tuple(players)])
queue = [(players, 0)]

# 幅優先探索
while queue:
    players, operations = queue.pop(0)
    p1, p2 = players
    # 2人のプレイヤーが同じマスにいる場合
    if p1 == p2:
        print(operations)
        exit()

    # 上下左右に移動して新しい位置を計算
    for x_move, y_move in DIRECTIONS:
        new_p1 = (p1[0] + x_move, p1[1] + y_move)
        new_p2 = (p2[0] + x_move, p2[1] + y_move)

        # 新しい位置がグリッド内かつ障害物でない場合
        if 0 <= new_p1[0] < N and 0 <= new_p1[1] < N and GRID[new_p1[0]][new_p1[1]] != '#':
            # プレイヤー2が移動できないから位置を元に戻す
            if not (0 <= new_p2[0] < N and 0 <= new_p2[1] < N and GRID[new_p2[0]][new_p2[1]] != '#'):
                new_p2 = p2
        else:
            # プレイヤー1が移動できないから位置を元に戻す
            new_p1 = p1
            # プレイヤー2が移動できないから位置を元に戻す
            if not (0 <= new_p2[0] < N and 0 <= new_p2[1] < N and GRID[new_p2[0]][new_p2[1]] != '#'):
                new_p2 = p2

        # 移動先に行ったことがないの場合のみキューに追加
        if (new_p1, new_p2) not in visited:
            visited.add((new_p1, new_p2))
            queue.append([(new_p1, new_p2), operations + 1])

print(-1)
