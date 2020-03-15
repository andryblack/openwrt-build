#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lua53static
PKG_VERSION:=5.3.5
PKG_RELEASE:=1

PKG_SOURCE:=lua-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.lua.org/ftp/ \
	http://www.tecgraf.puc-rio.br/lua/ftp/
PKG_HASH:=0c2eed3f960446e1a3e4b9a1ca2f3ff893b6ce41942cf54d5dd59ab4b3b058ac
PKG_BUILD_PARALLEL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/lua-$(PKG_VERSION)
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYRIGHT

include $(INCLUDE_DIR)/package.mk



define Package/lua53static
  SUBMENU:=
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (libraries)
  URL:=http://www.lua.org/
  MAINTAINER:=Jo-Philipp Wich <jo@mein.io>
  BUILDONLY:=1
endef

define Package/lua53static/description
  Lua is a powerful, efficient, lightweight, embeddable scripting language. It
  supports procedural programming, object-oriented programming, functional
  programming, data-driven programming, and data description.
endef

TARGET_CFLAGS += -DLUA_USE_LINUX $(FPIC) -std=gnu99
PC_FILE = $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/lua-5.3.pc

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		AR="$(TARGET_CROSS)ar rcu" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		INSTALL_ROOT=/usr \
		CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" \
		PKG_VERSION=$(PKG_VERSION) \
		linux
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		INSTALL_TOP="$(PKG_INSTALL_DIR)/usr" \
		install
	# create pkg-config
	mkdir -p $(PKG_INSTALL_DIR)/usr/lib/pkgconfig
	cat ./files/lua-5.3.pc > $(PC_FILE)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/lua5.3 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lua5.3/lua{,lib,conf}.h $(1)/usr/include/lua5.3/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lua5.3/lua.hpp $(1)/usr/include/lua5.3/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lua5.3/lauxlib.h $(1)/usr/include/lua5.3/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblua5.3.a $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/lua*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/lua53static/install
endef

$(eval $(call BuildPackage,lua53static))
