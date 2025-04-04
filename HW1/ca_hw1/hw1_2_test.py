def length_of_lis(nums):
    if not nums:
        return 0

    n = len(nums)
    dp = [1] * n

    for i in range(1, n):
        for j in range(i):
            if nums[j] < nums[i]:
                dp[i] = max(dp[i], dp[j] + 1)

    return max(dp)


nums = [4, 5, 1, 8, 3, 6, 9, 2]

nums_20 = [5, 1, 3, 2, 6, 4, 9, 7, 8, 11, 10, 13, 12, 15, 14, 18, 17, 16, 19, 20]  # 11

nums_25 = [10, 2, 3, 1, 5, 4, 7, 6, 9, 8, 11, 13, 12, 15, 14, 17, 16, 19, 18, 20, 21, 22, 24, 23, 25]  # 15

nums_30 = [1, 3, 2, 5, 4, 6, 7, 8, 9, 11, 10, 13, 12, 15, 14, 16, 17, 18, 19, 20, 23, 22, 21, 24, 25, 26, 27, 28, 29, 30]  # 23

nums_35 = [1, 3, 2, 5, 4, 6, 7, 8, 9, 11, 10, 13, 12, 15, 14, 16, 17, 18, 19, 20, 23, 22, 21, 24, 25, 26, 27, 28, 29, 30, 32, 31, 34, 33, 35]  # 26

nums_40 = [
    3, 1, 2, 4, 5, 6, 8, 7, 9, 11, 10, 13, 12, 14, 15, 17, 16, 18, 19, 20, 22, 21, 23, 24, 26, 25, 27, 28, 29, 30, 31, 32, 33, 35, 34, 36, 37, 38, 39,
    40
]  # 32

nums_50 = [
    3, 10, 2, 1, 20, 4, 5, 6, 7, 8, 9, 12, 0, 14, 15, 13, 11, 18, 17, 16, 19, 21, 22, 23, 25, 24, 26, 27, 28, 29, 8, 7, 30, 31, 32, 2, 1, 0, 33, 34,
    35, 36, 37, 38, 39, 40, 41, 42, 43, 44
]  # return 35

print(length_of_lis(nums_40))
