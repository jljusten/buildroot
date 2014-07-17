################################################################################
#
# piglit
#
################################################################################

PIGLIT_VERSION = 972b638d1ad0fb33a6e1b6773e0417df01eb0bbe
PIGLIT_SITE = git://anongit.freedesktop.org/git/piglit
PIGLIT_LICENSE = MIT
PIGLIT_LICENSE_FILES = COPYING
PIGLIT_INSTALL_STAGING = YES
PIGLIT_INSTALL_TARGET = YES

PIGLIT_DEPENDENCIES = mesa3d python python-mako python-numpy glu

# FIXME: Change when/if CL becomes an option.
PIGLIT_CONF_OPT = -DPIGLIT_BUILD_CL_TESTS=OFF

PIGLIT_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
PIGLIT_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
	PIGLIT_DEPENDENCIES += libgles
	# In buildroot, GLES seems to mean gles2
	PIGLIT_CONT_OPT += -DPIGLIT_BUILD_GLES1_TESTS=OFF \
			   -DPIGLIT_BUILD_GLES2_TESTS=ON \
			   -DPIGLIT_BUILD_GLES3_TESTS=OFF
else
	PIGLIT_CONT_OPT += -DPIGLIT_BUILD_GLES1_TESTS=OFF \
			   -DPIGLIT_BUILD_GLES2_TESTS=OFF \
			   -DPIGLIT_BUILD_GLES3_TESTS=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL), y)
	PIGLIT_CONF_OPT += -DPIGLIT_BUILD_GL_TESTS=ON
endif

PIGLIT_DEPENDENCIES += waffle
PIGLIT_CONF_OPT += -DPIGLIT_USE_WAFFLE=ON

$(eval $(cmake-package))
