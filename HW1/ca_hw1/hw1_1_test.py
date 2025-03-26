def fact(n):
    if n == 0:
        return 4
    elif n % 2 == 1:
        return 4 * fact((n - 1) // 2) + 8 * n + 3
    else:
        return 4 * fact((n - 2) // 2) + 8 * n + 3


print(fact(7))  # 599
print(fact(10))  # 655
print(fact(250))  # 254415
print(fact(400))  # 940255
