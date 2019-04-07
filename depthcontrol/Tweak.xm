#import <UIKit/UIKit.h>

@interface CAMCaptureCapabilities
@end

%hook CAMCaptureCapabilities

-(bool) isDepthEffectApertureSupported {
	return TRUE;
}
%end

@interface FigCaptureSourceVideoFormat
@end

%hook FigCaptureSourceVideoFormat

-(float)minSimulatedAperture {
		return 1.4;
}

-(float)maxSimulatedAperture {
		return 16;
}

-(float)defaultSimulatedAperture {
		return 4.5;
}
%end

@interface AVCaptureDeviceFormat
@end

%hook AVCaptureDeviceFormat

-(float)minSimulatedAperture {
		return 1.4;
}

-(float)maxSimulatedAperture {
		return 16;
}

-(float)defaultSimulatedAperture {
		return 4.5;
}
%end

@interface CAMLightingControl
@end

%hook CAMLightingControl

-(void)setCenter:(CGPoint)argument {
return %orig;
}
%end

@interface CAMApertureButton
@end

%hook CAMApertureButton

-(void)setFrame:(CGRect)argument {
return %orig;
}

-(void)layoutSubviews {
return %orig;
}

%end

@interface PUAdjustmentsToolController
@end

%hook PUAdjustmentsToolController

-(void)viewWillAppear:(BOOL)argument {
		return %orig;
}

-(void)viewWillDissappear:(BOOL)argument {
		return %orig;
}
%end

@interface PURedeyeToolController
@end

%hook PURedeyeToolController

-(void)viewWillAppear:(BOOL)argument {
		return %orig;
}

-(void)viewWillDissappear:(BOOL)argument {
		return %orig;
}
%end

@interface CAMViewfinderViewController
@end

%hook CAMViewfinderViewController

-(bool) _shouldEnableApertureButton {
		return TRUE;
}
%end

