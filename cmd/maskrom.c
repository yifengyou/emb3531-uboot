/*
 * Copyright 2017 Rockchip Electronics Co., Ltd
 * Frank Wang <frank.wang@rock-chips.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#include <errno.h>
#include <common.h>
#include <command.h>
#include <console.h>
#include <g_dnl.h>
#include <part.h>
#include <usb.h>
#include <usb_mass_storage.h>
#include <rockusb.h>

void set_back_to_bootrom_dnl_flag(void);

static int do_maskrom(cmd_tbl_t *cmdtp, int flag, int argc, char *const argv[])
{
	set_back_to_bootrom_dnl_flag();
	do_reset(NULL, 0, 0, NULL);
	return 0;
}

U_BOOT_CMD(maskrom, 4, 1, do_maskrom,
	   "Just enter maskrom",
	   "Just enter maskrom\n"
);
