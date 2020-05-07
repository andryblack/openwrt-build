#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python2-pyserial
PKG_VERSION:=3.4
PKG_RELEASE:=1

PKG_SOURCE:=pyserial-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/cc/74/11b04703ec416717b247d789103277269d567db575d2fd88f25d9767fe3d/
PKG_HASH:=6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-pyserial-$(PKG_VERSION)

PKG_LICENSE:=BSD
PKG_MAINTAINER:=Micke Prag <micke.prag@telldus.se>

include $(INCLUDE_DIR)/package.mk
include ../python-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python-pyserial-klipper/Default
  SECTION:=lang-python
  CATEGORY:=Languages
  SUBMENU:=Python
  URL:=https://github.com/pyserial/pyserial
endef

define Package/python2-pyserial
$(call Package/python2-pyserial/Default)
  TITLE:=python-pyserial
  DEPENDS:=+PACKAGE_python2-pyserial:python2
  VARIANT:=python
endef

define Package/python2-pyserial/description
This module encapsulates the access for the serial port. It provides backends
for Python running on Windows, OSX, Linux, BSD (possibly any POSIX compliant
system) and IronPython. The module named "serial" automatically selects the
appropriate backend.
endef


$(eval $(call PyPackage,python2-pyserial))
$(eval $(call BuildPackage,python2-pyserial))
