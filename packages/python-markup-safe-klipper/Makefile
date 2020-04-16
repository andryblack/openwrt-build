# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-markup-safe-klipper
PKG_VERSION:=1.1.1
PKG_RELEASE:=1

PKG_SOURCE:=MarkupSafe-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/source/M/MarkupSafe
PKG_HASH:=29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b
PKG_BUILD_DEPENDS:=python 
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/../feeds/packages/lang/python/python-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python-markup-safe-klipper
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  URL:=https://github.com/pallets/markupsafe/
  TITLE:=python-markupsafe
  DEPENDS:=+python-light
  VARIANT:=python
endef

define Package/python-markup-safe-klipper/description
MarkupSafe implements a XML/HTML/XHTML Markup safe string for Python
endef

$(eval $(call PyPackage,python-markup-safe-klipper))
$(eval $(call BuildPackage,python-markup-safe-klipper))
