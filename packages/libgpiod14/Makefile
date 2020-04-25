#
# Copyright (C) 2018 Michael Heimpold <mhei@heimpold.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libgpiod14
PKG_VERSION:=1.4.3
PKG_RELEASE:=1

PKG_SOURCE:=libgpiod-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
PKG_HASH:=ea959b3eb07b614fae9a079328b82501326754228fb436acfd9991eb552b62e5
PKG_BUILD_DIR:=$(BUILD_DIR)/libgpiod-$(PKG_VERSION)
PKG_LICENSE:=LGPL-2.1+
PKG_LICENSE_FILES:=COPYING

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS += --enable-tools

define Package/libgpiod14
	SECTION:=libs
	CATEGORY:=Libraries
	URL:=https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
	TITLE:=Library for interacting with Linux's GPIO character device
	DEPENDS:=@GPIO_SUPPORT @(LINUX_4_9||LINUX_4_14)
endef

define Package/libgpiod14/description
	C library for interacting with the linux GPIO character device
	(gpiod stands for GPIO device).
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/gpiod.h $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgpiod.{so*,a} $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libgpiod.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libgpiod14/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgpiod.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef


$(eval $(call BuildPackage,libgpiod14))
