#
# Download realtek r8126 linux driver from official site:
# [https://www.realtek.com/Download/List?cate_id=584]
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=r8126
PKG_VERSION:=10.013.00
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/r8126
  TITLE:=Driver for Realtek r8126 chipsets
  SUBMENU:=Network Devices
  DEPENDS:=@PCI_SUPPORT
  FILES:= $(PKG_BUILD_DIR)/r8126.ko
  AUTOLOAD:=$(call AutoProbe,r8126)
endef

define Package/r8126/description
  This package contains a driver for Realtek r8126 chipsets.
endef

define Build/Compile
	+$(KERNEL_MAKE) M=$(PKG_BUILD_DIR) modules
endef

$(eval $(call KernelPackage,r8126))
