def fact(n):
    if n == 0:
        return 4
    elif n % 2 == 1:  # 奇數情況
        return 4 * fact((n - 1) // 2) + 8 * n + 3
    else:  # 偶數情況
        return 4 * fact((n - 2) // 2) + 8 * n + 3


# 測試
print(fact(7))  # 599
print(fact(10))  # 655
