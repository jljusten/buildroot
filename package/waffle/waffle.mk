################################################################################
#
# waffle
#
################################################################################

WAFFLE_VERSION = 675c809c68357a7af05a9d13d3a0e907d6ffda6a
WAFFLE_SITE = git://github.com/waffle-gl/waffle.git
WAFFLE_LICENSE = BSD-2c
WAFFLE_LICENSE_FILES = LICENSE.txt
WAFFLE_INSTALL_STAGING = YES
WAFFLE_INSTALL_TARGET = YES

WAFFLE_DEPENDENCIES = mesa3d
WAFFLE_CONF_OPT = -DCMAKE_BUILD_TYPE=release

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
	WAFFLE_DEPENDENCIES += libxcb
	WAFFLE_CONF_OPT += -Dwaffle_has_glx=1
endif
ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
	WAFFLE_DEPENDENCIES += libegl
	WAFFLE_CONF_OPT += -Dwaffle_has_x11_egl=1
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
	WAFFLE_DEPENDENCIES += libgbm udev
	WAFFLE_CONF_OPT += -Dwaffle_has_gbm=1
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
	WAFFLE_DEPENDENCIES += wayland
	WAFFLE_CONF_OPT += -Dwaffle_has_wayland=1
endif

$(eval $(cmake-package))
