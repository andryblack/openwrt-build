#
# Copyright (C) 2020-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rpi-userland
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/raspberrypi/userland.git
PKG_SOURCE_VERSION:=6fb59736b1ae80fc62cddfe3309c800f72e1c07e
PKG_BUILD_DIR:=$(BUILD_DIR)/rpi-userland-$(PKG_VERSION)
#PKG_BUILD_DEPENDS:=cmake/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/rpi-userland
  SECTION:=multimedia
  CATEGORY:=Applications
  TITLE:=Raspberry Pi useraland
  URL:=https://github.com/raspberrypi/userland
  DEPENDS:=
endef

define Package/rpi-userland/description
 ARM side libraries for interfacing to Raspberry Pi GPU.
endef


CMAKE_HOST_FLAGS=\
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
	-DCMAKE_SHARED_LINKER_FLAGS="$(HOST_LDFLAGS)" \
	-DPKG_CONFIG_EXECUTABLE=Not-Found 

CMAKE_OPTIONS += \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DPKG_CONFIG_EXECUTABLE=$(STAGING_DIR_HOST)/bin/pkg-config \
	-DUSE_RPATH=OFF \
	-DCMAKE_USE_NAMESPACE=ON \
	-DCMAKE_NATIVE_BINARY_DIR=$(STAGING_DIR_HOST)/lib/$(PKG_NAME)-$(PKG_VERSION)/build_dir \
	-DCMAKE_BUILD_TYPE=Release -DARM64=OFF \
	-DCMAKE_C_COMPILER="$(TARGET_CROSS)gcc" \
	-DCMAKE_CXX_COMPILER="$(TARGET_CROSS)g++" \
	-DCMAKE_ASM_COMPILER="$(TARGET_CROSS)gcc" \
	-DCMAKE_SYSTEM_NAME=Linux \
	-DCMAKE_SYSTEM_PROCESSOR=arm \
	-DCMAKE_C_FLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -U_FORTIFY_SOURCE -mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard -marm" \
		
define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default, VERBOSE=1)
endef

define Build/Install
	$(call Build/Install/Default)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/opt/vc/include
	$(INSTALL_DIR) $(STAGING_DIR)/opt/vc/lib
	$(CP) -r $(PKG_INSTALL_DIR)/opt/vc/include/* $(STAGING_DIR)/opt/vc/include/
	$(CP) -r $(PKG_INSTALL_DIR)/opt/vc/lib/* $(STAGING_DIR)/opt/vc/lib/
endef

define Package/rpi-userland/install
	$(INSTALL_DIR) $(1)/opt/vc/lib
	$(CP) $(PKG_INSTALL_DIR)/opt/vc/lib/lib*.so \
		$(1)/opt/vc/lib/
	$(INSTALL_DIR) $(1)/opt/vc/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/vc/bin/* \
		 $(1)/opt/vc/bin/
endef

$(eval $(call BuildPackage,rpi-userland))
