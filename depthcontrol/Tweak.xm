#import <UIKit/UIKit.h>

static NSMutableDictionary *settings = [[NSMutableDictionary alloc]
                                      initWithContentsOfFile:[
                                      @"/var/mobile/Library/Preferences/com.llama.depthcontrol.plist" stringByExpandingTildeInPath]];
BOOL tweakEnabled = YES;

static void loadPrefs() {
        static NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.llama.depthcontrol.plist"]; //Load settings the old way.
        tweakEnabled = [[preferences objectForKey:@"dcenabled"] boolValue];

        [preferences release];
}

%ctor {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];
        loadPrefs();
        [pool release];
}

@interface CAMCaptureCapabilities
@end

%hook CAMCaptureCapabilities

-(bool) isDepthEffectApertureSupported {
	if (tweakEnabled) {
		return TRUE;
	}else{
		return FALSE;
	}
}
%end

@interface FigCaptureSourceVideoFormat
@end

%hook FigCaptureSourceVideoFormat

-(float)minSimulatedAperture {
	if (tweakEnabled) {
		return 1.4;
	}else{
		return 1.4;
	}
}

-(float)maxSimulatedAperture {
	if (tweakEnabled) {
		return 16;
	}else{
		return 16;
	}
}

-(float)defaultSimulatedAperture {
	if (tweakEnabled) {
		return 4.5;
	}else{
		return 4.5;
	}
}
%end

@interface AVCaptureDeviceFormat
@end

%hook AVCaptureDeviceFormat

-(float)minSimulatedAperture {
	if (tweakEnabled) {
		return 1.4;
	}else{
		return 1.4;
	}
}

-(float)maxSimulatedAperture {
	if (tweakEnabled) {
		return 16;
	}else{
		return 16;
	}
}

-(float)defaultSimulatedAperture {
	if (tweakEnabled) {
		return 4.5;
	}else{
		return 4.5;
	}
}
%end

@interface PUCropToolController
@end

%hook PUCropToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}
%end

@interface PUFiltersToolController
@end

%hook PUFiltersToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}
%end

@interface PUAdjustmentsToolController
@end

%hook PUAdjustmentsToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}
%end

@interface PURedeyeToolController
@end

%hook PURedeyeToolController

-(void)viewWillAppear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}

-(void)viewWillDissappear:(BOOL)argument {
	if (tweakEnabled) {
		return %orig;
	}else{
		return %orig;
	}
}
%end



@interface CAMViewfinderViewController
@end

%hook CAMViewfinderViewController

-(bool) _shouldEnableApertureButton {
	if (tweakEnabled) {
		return TRUE;
	}else{
		return FALSE;
	}
}
%end
