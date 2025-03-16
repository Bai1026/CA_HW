def length_of_lis(nums):
    if not nums:
        return 0

    n = len(nums)
    dp = [1] * n  # 初始化 dp 陣列，每個元素初始值為 1

    for i in range(1, n):
        for j in range(i):
            if nums[j] < nums[i]:  # 確保是遞增子序列
                dp[i] = max(dp[i], dp[j] + 1)

    return max(dp)  # 返回最大值，即 LIS 的長度


# 測試
nums = [4, 5, 1, 8, 3, 6, 9, 2]
print(length_of_lis(nums))  # 預期輸出: 4
