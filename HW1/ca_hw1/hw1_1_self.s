
.data
input: .word 7

.text
.global main

# This is 1132 CA Homework 1
# Implement fact(x) = 4*F(floor(n-1)/2) + 8n + 3 , where F(0)=4
# Input: n in a0(x10)
# Output: fact(n) in a0(x10)
# DO NOT MOTIFY "main" function

main:        
	# Load input into a0
	lw a0, input
	
	# Jump to fact   
	jal fact       

    # You should use ret or jalr x1 to jump back here after function complete
	# Exit program
    # System id for exit is 10 in Ripes, 93 in GEM5 !
    li a7, 10
    ecall

fact:
        # Base case: 如果 n == 0，返回 4
    li t0, 0        # t0 = 0
    li t1, 4        # t1 = 4
    beq a0, t0, return_base_case  # 如果 a0 == 0，跳到 return_base_case

    # 保存返回位址和 n 到堆疊
    addi sp, sp, -8  # 分配堆疊空間 (sp = sp - 8)
    sw ra, 4(sp)     # 保存返回位址
    sw a0, 0(sp)     # 保存 n

    # 判斷 n 是奇數還是偶數
    andi t2, a0, 1   # t2 = n & 1 (檢查最低位)
    beqz t2, even_case # 如果 n 是偶數，跳到 even_case

    # 如果 n 是奇數，計算 (n-1)/2
    addi a0, a0, -1  # a0 = n - 1
    srli a0, a0, 1   # a0 = (n-1) / 2
    jal fact         # 遞迴呼叫 fact((n-1)/2)
    j compute_result # 跳到計算結果

even_case:
    # 如果 n 是偶數，計算 n-2/2
    addi a0, a0, -2  # a0 = n - 2
    srli a0, a0, 1   # a0 = n / 2
    jal fact         # 遞迴呼叫 fact(n/2)

compute_result:
    # 恢復 n 和返回位址
    lw t3, 0(sp)     # 取回 n
    lw ra, 4(sp)     # 取回返回位址
    addi sp, sp, 8   # 釋放堆疊空間

    # 計算 4 * fact(遞迴結果)
    slli a0, a0, 2   # a0 = 4 * fact(x)

    # 計算 8n + 3
    slli t4, t3, 3   # t4 = 8 * n
    addi t4, t4, 3   # t4 = 8n + 3

    # 計算最終結果
    add a0, a0, t4   # a0 = 4 * fact(x) + 8n + 3

    # 返回
    jr ra      
    ret      

return_base_case:
    li a0, 4        # 返回 4
    jr ra
