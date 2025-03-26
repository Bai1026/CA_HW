
.data
nums:   .word 4, 5, 1, 8, 3, 6, 9 ,2, 15, 20, 9    # input sequence
n:      .word 11                        # sequence length
dp:     .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   # dp array


.text
.globl main

# This is 1132 CA Homework 1 Problem 2
# Implement Longest Increasing Subsequence Algorithm
# Input: 
#       sequence length (n) store in a0
#       address of sequence store in a1
#       address of dp array with length n store in a2 (we can decide to use or not)        
# Output: Length of Longest Increasing Subsequenc in a0(x10)

# DO NOT MODIFY "main" FUNCTION !!!

main:

    lw a0, n          # a0 = n
    la a1, nums       # a1 = &nums[0]
    la a2, dp         # a2 = &dp[0] 
      
    jal LIS         # Jump to LIS algorithm
    
    li a7, 1        # syscall 1: print integer
    ecall           # 執行輸出 a0, ecall is syscall -> like output number or string, read input, end seript, memory allocation
    
    # You should use ret or jalr x1 to jump back after algorithm complete
    # Exit program
    # System id for exit is 10 in Ripes, 93 in GEM5 
    li a7, 10
    ecall

LIS:
    li t0, 1
    mv t1, a2
    mv t2, a0

init_dp:
    sw t0, 0(t1)
    addi t1, t1, 4
    addi t2, t2, -1
    bnez t2, init_dp

    li t3, 1              # t3 = i
outer_loop:
    bge t3, a0, end_LIS

    li t4, 0              # t4 = j
inner_loop:
    bge t4, t3, next_i

    # nums[j]
    slli t5, t4, 2
    add t6, a1, t5        # t6 = &nums[j]
    lw t6, 0(t6)          # t6 = nums[j]

    # nums[i]
    slli s0, t3, 2
    add s1, a1, s0        # s1 = &nums[i]
    lw s1, 0(s1)          # s1 = nums[i]

    bge t6, s1, skip_update

    # dp[j] + 1
    add s2, a2, t5        # s2 = &dp[j]
    lw s2, 0(s2)
    addi s2, s2, 1

    # dp[i]
    add s3, a2, s0        # s3 = &dp[i]
    lw t5, 0(s3)          # t5 = dp[i]

    bge t5, s2, skip_update
    sw s2, 0(s3)          # dp[i] = s2

skip_update:
    addi t4, t4, 1
    j inner_loop

next_i:
    addi t3, t3, 1
    j outer_loop

end_LIS:
    li t3, 0              # i
    li t4, 1              # max

find_max:
    bge t3, a0, return_result
    slli t5, t3, 2
    add t5, a2, t5
    lw t6, 0(t5)
    bge t4, t6, skip_max_update
    mv t4, t6

skip_max_update:
    addi t3, t3, 1
    j find_max

return_result:
    mv a0, t4
    ret
