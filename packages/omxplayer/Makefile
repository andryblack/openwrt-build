#
# Copyright (C) 2020-2020 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=omxplayer
PKG_VERSION:=1.0.0
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/popcornmix/omxplayer.git
PKG_SOURCE_VERSION:=ecd446d2de7eb86a43acaae59807a8e5c173f80d
PKG_BUILD_DIR:=$(BUILD_DIR)/omxplayer-$(PKG_VERSION)
#PKG_BUILD_DEPENDS:=cmake/host

include $(INCLUDE_DIR)/package.mk

define Package/omxplayer
  SECTION:=multimedia
  CATEGORY:=Applications
  TITLE:=omxplayer
  URL:=https://github.com/popcornmix/omxplayer/
  DEPENDS:=+bcm27xx-userland +libopenssl +alsa-lib +libpcre +boost +getopt +libfreetype +libbz2 
endef

define Package/omxplayer/description
 OMXPlayer is a command-line video player for the Raspberry Pi.
endef

FFMPEG_CFLAGS=-D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -DTARGET_LINUX -fPIC -DPIC -D_REENTRANT -D_HAVE_SBRK -D_LARGEFILE64_SOURCE -DHAVE_CMAKE_CONFIG -DHAVE_VMCS_CONFIG -D_REENTRANT -DUSE_VCHIQ_ARM -DVCHI_BULK_ALIGN=1 -DVCHI_BULK_GRANULARITY=1 -DEGL_SERVER_DISPMANX -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D__VIDEOCORE4__ -DGRAPHICS_X_VG=1 -U_FORTIFY_SOURCE -Wall -DHAVE_OMXLIB -DUSE_EXTERNAL_FFMPEG  -DHAVE_LIBAVCODEC_AVCODEC_H -DHAVE_LIBAVUTIL_MEM_H -DHAVE_LIBAVUTIL_AVUTIL_H -DHAVE_LIBAVFORMAT_AVFORMAT_H -DHAVE_LIBAVFILTER_AVFILTER_H -DOMX -DOMX_SKIP64BIT
	
define Build/Configure
	rm -rf $(PKG_BUILD_DIR)/ffmpeg
	#CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(FFMPEG_CFLAGS)" \
	#CC="$(TARGET_CROSS)gcc" \
	#AR="$(TARGET_CROSS)ar rcu" \
	#RANLIB="$(TARGET_CROSS)ranlib" \
	#LDFLAGS="" \
		
	cd $(PKG_BUILD_DIR) && git clone git://source.ffmpeg.org/ffmpeg ffmpeg -b release/3.3 --depth=1
	cd $(PKG_BUILD_DIR)/ffmpeg && \
		./configure \
			--cross-prefix="$(TARGET_CROSS)" \
			--enable-cross-compile \
			--extra-cflags="-mfpu=vfp -mfloat-abi=hard $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(FFMPEG_CFLAGS)" \
			--pkg-config=pkg-config \
			--enable-shared \
			--disable-static \
			--arch=arm \
			--cpu=arm1176jzf-s \
			--target-os=linux \
			--disable-hwaccels \
			--enable-parsers \
			--disable-muxers \
			--disable-filters \
			--disable-encoders \
			--disable-devices \
			--disable-programs \
			--enable-shared \
			--disable-doc \
			--disable-postproc \
			--enable-gpl \
			--enable-version3 \
			--enable-protocols \
			--disable-libsmbclient \
			--disable-libssh \
			--enable-nonfree \
			--enable-openssl \
			--enable-pthreads \
			--enable-pic \
			--disable-armv5te \
			--disable-neon \
			--enable-armv6t2 \
			--enable-armv6 \
			--enable-hardcoded-tables \
			--disable-runtime-cpudetect \
			--disable-debug \
			--disable-crystalhd \
			--disable-decoder=h264_vda \
			--disable-decoder=h264_crystalhd \
			--disable-decoder=h264_vdpau \
			--disable-decoder=vc1_crystalhd \
			--disable-decoder=wmv3_crystalhd \
			--disable-decoder=wmv3_vdpau \
			--disable-decoder=mpeg1_vdpau \
			--disable-decoder=mpeg2_crystalhd \
			--disable-decoder=mpeg4_crystalhd \
			--disable-decoder=mpeg4_vdpau \
			--disable-decoder=mpeg_vdpau \
			--disable-decoder=mpeg_xvmc \
			--disable-decoder=msmpeg4_crystalhd \
			--disable-decoder=vc1_vdpau \
			--enable-decoder=mpegvideo \
			--enable-decoder=mpeg1video \
			--enable-decoder=mpeg2video \
			--disable-decoder=mvc1 \
			--disable-decoder=mvc2 \
			--disable-decoder=h261 \
			--disable-decoder=h263 \
			--disable-decoder=rv10 \
			--disable-decoder=rv20 \
			--enable-decoder=mjpeg \
			--enable-decoder=mjpegb \
			--disable-decoder=sp5x \
			--disable-decoder=jpegls \
			--enable-decoder=mpeg4 \
			--disable-decoder=rawvideo \
			--disable-decoder=msmpeg4v1 \
			--disable-decoder=msmpeg4v2 \
			--disable-decoder=msmpeg4v3 \
			--disable-decoder=wmv1 \
			--disable-decoder=wmv2 \
			--disable-decoder=h263p \
			--disable-decoder=h263i \
			--disable-decoder=svq1 \
			--disable-decoder=svq3 \
			--disable-decoder=dvvideo \
			--disable-decoder=huffyuv \
			--disable-decoder=cyuv \
			--enable-decoder=h264 \
			--disable-decoder=indeo3 \
			--disable-decoder=vp3 \
			--enable-decoder=theora \
			--disable-decoder=asv1 \
			--disable-decoder=asv2 \
			--disable-decoder=ffv1 \
			--disable-decoder=vcr1 \
			--disable-decoder=cljr \
			--disable-decoder=mdec \
			--disable-decoder=roq \
			--disable-decoder=xan_wc3 \
			--disable-decoder=xan_wc4 \
			--disable-decoder=rpza \
			--disable-decoder=cinepak \
			--disable-decoder=msrle \
			--disable-decoder=msvideo1 \
			--disable-decoder=idcin \
			--disable-decoder=smc \
			--disable-decoder=flic \
			--disable-decoder=truemotion1 \
			--disable-decoder=vmdvideo \
			--disable-decoder=mszh \
			--disable-decoder=zlib \
			--disable-decoder=qtrle \
			--disable-decoder=snow \
			--disable-decoder=tscc \
			--disable-decoder=ulti \
			--disable-decoder=qdraw \
			--disable-decoder=qpeg \
			--disable-decoder=png \
			--disable-decoder=ppm \
			--disable-decoder=pbm \
			--disable-decoder=pgm \
			--disable-decoder=pgmyuv \
			--disable-decoder=pam \
			--disable-decoder=ffvhuff \
			--disable-decoder=rv30 \
			--disable-decoder=rv40 \
			--enable-decoder=vc1 \
			--enable-decoder=wmv3 \
			--disable-decoder=loco \
			--disable-decoder=wnv1 \
			--disable-decoder=aasc \
			--disable-decoder=indeo2 \
			--disable-decoder=fraps \
			--disable-decoder=truemotion2 \
			--disable-decoder=bmp \
			--disable-decoder=cscd \
			--disable-decoder=mmvideo \
			--disable-decoder=zmbv \
			--disable-decoder=avs \
			--disable-decoder=nuv \
			--disable-decoder=kmvc \
			--disable-decoder=flashsv \
			--disable-decoder=cavs \
			--disable-decoder=jpeg2000 \
			--disable-decoder=vmnc \
			--disable-decoder=vp5 \
			--enable-decoder=vp6 \
			--enable-decoder=vp6f \
			--disable-decoder=targa \
			--disable-decoder=dsicinvideo \
			--disable-decoder=tiertexseqvideo \
			--disable-decoder=tiff \
			--disable-decoder=gif \
			--disable-decoder=dxa \
			--disable-decoder=thp \
			--disable-decoder=sgi \
			--disable-decoder=c93 \
			--disable-decoder=bethsoftvid \
			--disable-decoder=ptx \
			--disable-decoder=txd \
			--disable-decoder=vp6a \
			--disable-decoder=amv \
			--disable-decoder=vb \
			--disable-decoder=pcx \
			--disable-decoder=sunrast \
			--disable-decoder=indeo4 \
			--disable-decoder=indeo5 \
			--disable-decoder=mimic \
			--disable-decoder=rl2 \
			--disable-decoder=escape124 \
			--disable-decoder=dirac \
			--disable-decoder=bfi \
			--disable-decoder=motionpixels \
			--disable-decoder=aura \
			--disable-decoder=aura2 \
			--disable-decoder=v210x \
			--disable-decoder=tmv \
			--disable-decoder=v210 \
			--disable-decoder=dpx \
			--disable-decoder=frwu \
			--disable-decoder=flashsv2 \
			--disable-decoder=cdgraphics \
			--disable-decoder=r210 \
			--disable-decoder=anm \
			--disable-decoder=iff_ilbm \
			--disable-decoder=kgv1 \
			--disable-decoder=yop \
			--enable-decoder=vp8 \
			--disable-decoder=webp \
			--disable-decoder=pictor \
			--disable-decoder=ansi \
			--disable-decoder=r10k \
			--disable-decoder=mxpeg \
			--disable-decoder=lagarith \
			--disable-decoder=prores \
			--disable-decoder=jv \
			--disable-decoder=dfa \
			--disable-decoder=wmv3image \
			--disable-decoder=vc1image \
			--disable-decoder=utvideo \
			--disable-decoder=bmv_video \
			--disable-decoder=vble \
			--disable-decoder=dxtory \
			--disable-decoder=v410 \
			--disable-decoder=xwd \
			--disable-decoder=cdxl \
			--disable-decoder=xbm \
			--disable-decoder=zerocodec \
			--disable-decoder=mss1 \
			--disable-decoder=msa1 \
			--disable-decoder=tscc2 \
			--disable-decoder=mts2 \
			--disable-decoder=cllc \
			--disable-decoder=mss2 \
			--disable-decoder=y41p \
			--disable-decoder=escape130 \
			--disable-decoder=exr \
			--disable-decoder=avrp \
			--disable-decoder=avui \
			--disable-decoder=ayuv \
			--disable-decoder=v308 \
			--disable-decoder=v408 \
			--disable-decoder=yuv4 \
			--disable-decoder=sanm \
			--disable-decoder=paf_video \
			--disable-decoder=avrn \
			--disable-decoder=cpia \
			--disable-decoder=bintext \
			--disable-decoder=xbin \
			--disable-decoder=idf \
			--disable-decoder=hevc \
			--enable-decoder=opus 
			
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/ffmpeg DESTDIR="$(PKG_BUILD_DIR)/ffmpeg_compiled" install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		CXX="$(TARGET_CROSS)g++" \
		AR="$(TARGET_CROSS)ar rcu" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		SDKSTAGE=$(STAGING_DIR) \
		STRIP="$(TARGET_CROSS)strip" \
		NO_DBUS=1 \
		INCLUDES="-I./ -Ilinux -Iffmpeg_compiled/usr/local/include/ -I$(STAGING_DIR)/usr/include/freetype2 -isystem$(STAGING_DIR)/opt/vc/include -isystem$(STAGING_DIR)/opt/vc/include/interface/vcos/pthreads" \
		dist
endef

define Package/omxplayer/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/omxplayer
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_DIR) $(1)/usr/share/fonts/truetype/freefont

	$(INSTALL_BIN) ./files/omxplayer $(1)/usr/bin/

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/omxplayer.bin $(1)/usr/bin/
	$(CP) -P $(PKG_BUILD_DIR)/ffmpeg_compiled/usr/local/lib/*.so* $(1)/usr/lib/omxplayer/
	$(CP) -P $(PKG_BUILD_DIR)/fonts/*.ttf $(1)/usr/share/fonts/truetype/freefont/
endef

$(eval $(call BuildPackage,omxplayer,+libbz2))
