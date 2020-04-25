#
# Copyright (C) 2020-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rpi-userland
PKG_VERSION:=1.0.0
PKG_RELEASE:=2

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
  DEPENDS:=+rpi-zero-prepare
endef

define Package/rpi-userland/description
 ARM side libraries for interfacing to Raspberry Pi GPU.
endef


CMAKE_OPTIONS += \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DPKG_CONFIG_EXECUTABLE=$(STAGING_DIR_HOST)/bin/pkg-config \
	-DCMAKE_NATIVE_BINARY_DIR=$(STAGING_DIR_HOST)/lib/$(PKG_NAME)-$(PKG_VERSION)/build_dir \
	-DCMAKE_BUILD_TYPE=Release -DARM64=OFF \
	-DCMAKE_C_FLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -U_FORTIFY_SOURCE" 
		
define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(call Build/Compile/Default, VERBOSE=1)
endef

RPI_MAKE_CFLAGS=-DSTANDALONE -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -D_LINUX -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -U_FORTIFY_SOURCE -Wall -g -DHAVE_LIBOPENMAX=2 -DOMX -DOMX_SKIP64BIT -DUSE_EXTERNAL_OMX -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST -DUSE_VCHIQ_ARM
define Build/Install
	
	$(call Build/Install/Default)
	$(MAKE) -C $(PKG_BUILD_DIR)/host_applications/linux/apps/hello_pi/libs/ilclient \
		SDKSTAGE=$(PKG_INSTALL_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		AR="$(TARGET_CROSS)ar " \
		CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(RPI_MAKE_CFLAGS) " \
		RANLIB="$(TARGET_CROSS)ranlib"
	$(CP) $(PKG_BUILD_DIR)/host_applications/linux/apps/hello_pi/libs/ilclient/*.a \
		$(PKG_INSTALL_DIR)/opt/vc/src/hello_pi/libs/ilclient/
	$(MAKE) -C $(PKG_BUILD_DIR)/host_applications/linux/apps/hello_pi/hello_video \
		SDKSTAGE=$(PKG_INSTALL_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		AR="$(TARGET_CROSS)ar " \
		CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(RPI_MAKE_CFLAGS) " \
		RANLIB="$(TARGET_CROSS)ranlib" 
	$(TARGET_CROSS)gcc $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(RPI_MAKE_CFLAGS) \
		-I$(PKG_BUILD_DIR)/host_applications/vmcs/test_apps/mmalplay \
		-I$(PKG_INSTALL_DIR)/opt/vc/include \
		$(PKG_BUILD_DIR)/host_applications/vmcs/test_apps/mmalplay/mmalplay.c \
		$(PKG_BUILD_DIR)/host_applications/vmcs/test_apps/mmalplay/playback.c \
		-o $(PKG_BUILD_DIR)/mmalplay \
		-L$(PKG_INSTALL_DIR)/opt/vc/lib \
		-lmmal -lmmal_core  -lmmal_util \
		-lpthread -lvcos
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/opt/vc/include
	$(INSTALL_DIR) $(STAGING_DIR)/opt/vc/lib
	$(INSTALL_DIR) $(STAGING_DIR)/opt/vc/lib/plugins
	$(CP) -r $(PKG_INSTALL_DIR)/opt/vc/include/* $(STAGING_DIR)/opt/vc/include/
	$(CP) -r $(PKG_INSTALL_DIR)/opt/vc/lib/* $(STAGING_DIR)/opt/vc/lib/
endef

define Package/rpi-userland/install
	$(INSTALL_DIR) $(1)/opt/vc/lib

	$(CP) $(PKG_INSTALL_DIR)/opt/vc/lib/lib*.so \
		$(1)/opt/vc/lib/
	
	$(INSTALL_DIR) $(1)/opt/vc/lib/plugins
	
	$(CP) $(PKG_INSTALL_DIR)/opt/vc/lib/plugins/*.so \
		$(1)/opt/vc/lib/plugins/
	
	$(INSTALL_DIR) $(1)/opt/vc/bin
	
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/opt/vc/bin/* \
		$(1)/opt/vc/bin/
	
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/host_applications/linux/apps/hello_pi/hello_video/hello_video.bin \
		$(1)/opt/vc/bin/
    
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mmalplay \
		$(1)/opt/vc/bin/
endef

$(eval $(call BuildPackage,rpi-userland))
