/*
 * Copyright (C) 2013 Jean-Christophe PLAGNIOL-VILLARD <plagnio@jcrosoft.com>
 *
 * GPLv2 only
 */

#include <common.h>
#include <linux/sizes.h>
#include <asm/barebox-arm-head.h>
#include <asm/barebox-arm.h>
#include <asm/system_info.h>

void __naked barebox_arm_reset_vector(uint32_t r0, uint32_t r1, uint32_t r2)
{
	arm_cpu_lowlevel_init();
	barebox_arm_entry(0x00000000, SZ_512M, NULL);
}
