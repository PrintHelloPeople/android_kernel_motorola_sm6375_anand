DLKM_DIR := motorola/kernel/modules
LOCAL_PATH := $(call my-dir)

ifeq ($(TOUCHSCREEN_GOODIX_BRL_SPI),true)
ifeq ($(call is-board-platform-in-list,taro kalama parrot crow pineapple), true)
	KBUILD_OPTIONS += CONFIG_TOUCHSCREEN_GOODIX_BRL_SPI=y
else
	KERNEL_CFLAGS += CONFIG_TOUCHSCREEN_GOODIX_BRL_SPI=y
endif
endif


include $(CLEAR_VARS)
LOCAL_MODULE := goodix_gt96x_mmi.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
ifneq ($(findstring touchscreen_mmi.ko,$(BOARD_VENDOR_KERNEL_MODULES)),)
	KBUILD_OPTIONS += CONFIG_INPUT_TOUCHSCREEN_MMI=y
	LOCAL_ADDITIONAL_DEPENDENCIES += $(KERNEL_MODULES_OUT)/touchscreen_mmi.ko
endif

KBUILD_OPTIONS_GKI += GKI_OBJ_MODULE_DIR=gki
include $(DLKM_DIR)/AndroidKernelModule.mk
