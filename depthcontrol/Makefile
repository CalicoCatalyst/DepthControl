ARCHS = arm64
TARGET = iphone:clang:11.2:11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DepthControl
DepthControl_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.apple.camera"
SUBPROJECTS += depthcontrol
include $(THEOS_MAKE_PATH)/aggregate.mk
