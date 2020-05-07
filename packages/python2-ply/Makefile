#
# Copyright (C) 2015-2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python2-ply
PKG_VERSION:=3.11
PKG_RELEASE:=1

PKG_SOURCE:=ply-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.dabeaz.com/ply \
                https://files.pythonhosted.org/packages/source/p/ply
PKG_HASH:=00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-ply-$(PKG_VERSION)

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=README.md
PKG_MAINTAINER:=Jeffery To <jeffery.to@gmail.com>

include $(INCLUDE_DIR)/package.mk
include ../python-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python2-ply/Default
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=lex and yacc for Python
  URL:=http://www.dabeaz.com/ply/
endef

define Package/python2-ply
$(call Package/python2-ply/Default)
  DEPENDS:=+PACKAGE_python2-ply:python2
  VARIANT:=python
endef


define Package/python2-ply/description
PLY is a 100% Python implementation of the common parsing tools lex
and yacc.
endef


$(eval $(call PyPackage,python2-ply))
$(eval $(call BuildPackage,python2-ply))