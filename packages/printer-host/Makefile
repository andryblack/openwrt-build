#
# Copyright (C) 2020-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=printer-host
PKG_VERSION:=1.0.0
PKG_RELEASE:=5

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/andryblack/printer-host.git
PKG_SOURCE_VERSION:=44e90a800b845699e9c9d72c29b5dc878f30175d
PKG_BUILD_DIR:=$(BUILD_DIR)/printer-host-$(PKG_VERSION)

#HOST_BUILD_DEPENDS:=premake/host
PKG_BUILD_DEPENDS:=premake5/host lua53static

include $(INCLUDE_DIR)/package.mk

define Package/printer-host
  SECTION:=utils
  CATEGORY:=Applications
  TITLE:=3D printing server
  URL:=https://github.com/andryblack/printer-host
  DEPENDS:=+libuv +yajl +libopenssl +librt +libstdcpp +rpi-zero-prepare
  USERID:=printhost:services
endef

define Package/printer-host/description
 3D printing server
endef


define Build/Configure
	pkg-config --cflags lua-5.3
	pkg-config --cflags yajl
	cd $(PKG_BUILD_DIR) && premake5 gmake --os=linux
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/build config=release verbose=1 \
			CC="$(TARGET_CROSS)gcc" \
			CXX="$(TARGET_CROSS)g++" \
			AR="$(TARGET_CROSS)ar" \
			RANLIB="$(TARGET_CROSS)ranlib" \
			CPPFLAGS="$(TARGET_CPPFLAGS)" \
			CFLAGS="$(TARGET_CFLAGS)" \
			CXXFLAGS="$(TARGET_CXXFLAGS)" \
			LDFLAGS="$(TARGET_LDFLAGS)"
	$(MAKE) -C $(PKG_BUILD_DIR) local-modules
endef

define Package/printer-host/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/printer-host $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)/lib
	$(CP) $(PKG_BUILD_DIR)/extlib/router.lua/router.lua $(1)/usr/share/$(PKG_NAME)/lib
	$(CP) -pR $(PKG_BUILD_DIR)/extlib/llae/scripts/* $(1)/usr/share/$(PKG_NAME)/lib/; 
	$(CP) -pR $(PKG_BUILD_DIR)/extlib/lua-resty-template/lib/* $(1)/usr/share/$(PKG_NAME)/lib/; 
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)/app
	$(CP) -pR $(PKG_BUILD_DIR)/scripts/* $(1)/usr/share/$(PKG_NAME)/app/; 
	$(INSTALL_DIR) $(1)/usr/share/$(PKG_NAME)/www
	$(CP) -pR $(PKG_BUILD_DIR)/www/* $(1)/usr/share/$(PKG_NAME)/www/;
	$(INSTALL_DIR) $(1)/etc
	touch $(1)/etc/print-host-config.lua 
	chmod 644 $(1)/etc/print-host-config.lua 
	echo "files='/mnt/data/files'" > $(1)/etc/print-host-config.lua
	echo "http_root='/usr/share/$(PKG_NAME)/www'" >> $(1)/etc/print-host-config.lua
	echo "modules='/usr/share/$(PKG_NAME)/lib/?.lua'" >> $(1)/etc/print-host-config.lua
	echo "port=8080" >> $(1)/etc/print-host-config.lua
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/$(PKG_NAME).defaults $(1)/etc/uci-defaults/99-$(PKG_NAME)
endef

$(eval $(call BuildPackage,printer-host))
