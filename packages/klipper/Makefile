#
# Copyright (C) 2020-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=klipper
PKG_VERSION:=0.8.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/KevinOConnor/klipper.git
PKG_SOURCE_VERSION:=03fb7961b444013c2dc5ec5de40d9901f4c3eb57
PKG_BUILD_DIR:=$(BUILD_DIR)/klipper-$(PKG_VERSION)

HOST_PYTHON_PACKAGE_BUILD_DEPENDS:="cffi==1.12.2"

#PKG_BUILD_DEPENDS:=premake5/host lua53static

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/python/python-package.mk

define Package/klipper
	SECTION:=utils
	CATEGORY:=Applications
	TITLE:=3D printing firmware
	URL:=https://www.klipper3d.org/
	DEPENDS:=+python-light +python-pyserial +python-cffi-klipper +python-jinja2-klipper +python-greenlet-klipper \
		+python-logging +python-codecs
	USERID:=services:klipper
	VARIANT:=python
endef

define Package/klipper/description
	3D printing firmware
endef


define Build/Configure
	mkdir -p $(PKG_BUILD_DIR)/build
	cp ./files/build.mk $(PKG_BUILD_DIR)/build/
endef

define Build/Compile
	
	$(MAKE) -C $(PKG_BUILD_DIR)/klippy/chelper -f $(PKG_BUILD_DIR)/build/build.mk OBJDIR=$(PKG_BUILD_DIR)/build \
		CC="$(TARGET_CROSS)gcc" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)"
	
endef

define Package/klipper/install
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc
	$(CP) -pR $(PKG_BUILD_DIR)/klippy $(1)/usr/share/$(PKG_NAME)/
	$(CP) $(PKG_BUILD_DIR)/config/example.cfg $(1)/etc/printer.cfg
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/$(PKG_NAME).defaults $(1)/etc/uci-defaults/99-$(PKG_NAME)
endef

$(eval $(call BuildPackage,klipper))
