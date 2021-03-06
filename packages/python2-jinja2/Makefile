# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python2-jinja2
PKG_VERSION:=2.10.1
PKG_RELEASE:=1

PKG_SOURCE:=Jinja2-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/source/J/Jinja2
PKG_HASH:=065c4f02ebe7f7cf559e49ee5a95fb800a9e4528727aec6f24402a5374c65013

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-jinja2-klipper-$(PKG_VERSION)

PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE
PKG_CPE_ID:=cpe:/a:pocoo:jinja2

HOST_PYTHON_PACKAGE_BUILD_DEPENDS:="MarkupSafe==1.1.1"

include $(INCLUDE_DIR)/package.mk
include ../python-package.mk

PKG_UNPACK:=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

define Package/python2-jinja2
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Jinja2
  URL:=http://jinja.pocoo.org/
  DEPENDS:=+python2 +python2-markup-safe
  VARIANT:=python
endef

define Package/python2-jinja2/description
Jinja2 is a full featured template engine for Python. It has full
unicode support, an optional integrated sandboxed execution
environment, widely used and BSD licensed.
endef

$(eval $(call PyPackage,python2-jinja2))
$(eval $(call BuildPackage,python2-jinja2))
