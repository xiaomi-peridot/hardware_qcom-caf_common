# Platform name variables - used in makefiles everywhere
MSMSTEPPE := sm6150
TRINKET := trinket #SM6125

UM_5_15_FAMILY_LEGACY := bengal

# UM families
UM_3_18_FAMILY := msm8996 msm8937 msm8953
UM_4_4_FAMILY := msm8998 sdm660
UM_4_9_FAMILY := sdm845 sdm710
UM_4_14_FAMILY := msmnile $(MSMSTEPPE) $(TRINKET) atoll
UM_4_19_FAMILY_BASE := kona lito
UM_5_4_FAMILY := lahaina holi
UM_5_10_FAMILY := taro parrot
UM_5_15_FAMILY_BASE := kalama crow
UM_6_1_FAMILY := pineapple

# Conditionally modify the UM families based on TARGET_BOARD_SUFFIX and TARGET_BOARD_PLATFORM
ifneq ($(filter $(UM_5_15_FAMILY_LEGACY),$(TARGET_BOARD_PLATFORM)),)
    ifeq ($(TARGET_BOARD_SUFFIX),_515)
        UM_4_19_FAMILY := $(UM_4_19_FAMILY_BASE)
        UM_5_15_FAMILY := $(UM_5_15_FAMILY_BASE) $(UM_5_15_FAMILY_LEGACY)
    else
        UM_4_19_FAMILY := $(UM_4_19_FAMILY_BASE) bengal
        UM_5_15_FAMILY := $(UM_5_15_FAMILY_BASE)
    endif
else
    UM_4_19_FAMILY := $(UM_4_19_FAMILY_BASE) bengal
    UM_5_15_FAMILY := $(UM_5_15_FAMILY_BASE)
endif
