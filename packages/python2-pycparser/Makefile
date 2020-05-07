#
# Copyright (C) 2015-2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python2-pycparser
PKG_VERSION:=2.20
PKG_RELEASE:=1

PKG_SOURCE:=pycparser-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/source/p/pycparser
PKG_HASH:=2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-pycparser-$(PKG_VERSION)

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Jeffery To <jeffery.to@gmail.com>

HOST_PYTHON_PACKAGE_BUILD_DEPENDS:="ply==3.10"
HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:="ply==3.10"

include $(INCLUDE_DIR)/package.mk
include ../python-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python2-pycparser/Default
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=C parser in Python
  URL:=https://github.com/eliben/pycparser
endef

define Package/python2-pycparser
$(call Package/python2-pycparser/Default)
  DEPENDS:= \
      +PACKAGE_python2-pycparser:python2 \
      +PACKAGE_python2-pycparser:python2-ply
  VARIANT:=python
endef

define Package/python2-pycparser/description
pycparser is a parser for the C language, written in pure Python. It is a
module designed to be easily integrated into applications that need to parse
C source code.
endef

$(eval $(call PyPackage,python2-pycparser))
$(eval $(call BuildPackage,python2-pycparser))
