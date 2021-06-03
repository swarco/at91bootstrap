/*
 * Copyright (C) 2021 Microchip Technology Inc. and its subsidiaries
 *
 * SPDX-License-Identifier: MIT
 */

/*
 * OP-TEE expect the following boot arguments
 * r0: pagestore
 * r1: (ARMv7 standard bootarg #1)
 * r2: device tree address, (ARMv7 standard bootarg #2)
 * lr: non-secure entry address (ARMv7 bootarg #0)
 */
.global optee_start
optee_start:
	mov     lr, r3
	ldr     pc, =OPTEE_JUMP_ADDR

1:
	/* We should never return from OP-TEE */
	b       1b

.end