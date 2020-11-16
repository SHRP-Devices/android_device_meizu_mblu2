ifneq ($(MBLU2_32_BUILD),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
endif
$(call inherit-product, build/target/product/embedded.mk)
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_MANUFACTURER := lge
PRODUCT_RELEASE_NAME := m253
PRODUCT_NAME := omni_m253
PRODUCT_DEVICE := m253
PRODUCT_MODEL := K-430
PRODUCT_BRAND := LGE
