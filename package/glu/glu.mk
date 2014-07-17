################################################################################
#
# glu
#
################################################################################

GLU_VERSION = 9.0.0
GLU_SOURCE = glu-$(GLU_VERSION).tar.bz2
GLU_SITE = ftp://ftp.freedesktop.org/pub/mesa/glu/
GLU_LICENSE = SGI-B-2.0
GLU_AUTORECONF = YES

GLU_INSTALL_STAGING = YES

GLU_DEPENDENCIES = mesa3d

$(eval $(autotools-package))
