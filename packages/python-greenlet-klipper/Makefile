# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-greenlet-klipper
PKG_VERSION:=0.4.15
PKG_RELEASE:=1

PKG_SOURCE:=greenlet-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/f8/e8/b30ae23b45f69aa3f024b46064c0ac8e5fcb4f22ace0dca8d6f9c8bbe5e7
PKG_HASH:=9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-greenlet-klipper-$(PKG_VERSION)

PKG_MAINTAINER:=Alexey Borzenkov <snaury@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PYTHON_PKG_SETUP_ARGS:=

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/python/python-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python-greenlet-klipper
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=greenlet
  URL:=https://github.com/python-greenlet/greenlet
  DEPENDS:=+python-light 
  VARIANT:=python
endef

define Package/python-greenlet-klipper/description
Greenlets are lightweight coroutines for in-process concurrent programming.
endef



$(eval $(call PyPackage,python-greenlet-klipper))
$(eval $(call BuildPackage,python-greenlet-klipper))
$(eval $(call BuildPackage,python-greenlet-klipper-src))
