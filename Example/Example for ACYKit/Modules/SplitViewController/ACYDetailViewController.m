//
//  ACYDetailViewController.m
//  ACYKit
//
//  Created by Arthur Qiu on 23/04/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYDetailViewController.h"
#import "ACYWatchdogTimer.h"
#import <Masonry/Masonry.h>
#import "ACYContainerView.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ACYDetailViewController ()

// UI
@property (nonatomic, strong) UIView *panGestureView;

@property (nonatomic, strong) CADisplayLink *timer;

@property (nonatomic, strong) NSObject *obj;

@end

@implementation ACYDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
//	[self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_handlePanGesture:)];
    
    [self.view addGestureRecognizer:pan];
    
    [self.view acy_addSubviews:@[self.panGestureView]];
//    
    [self.panGestureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    ACYContainerView *view = [ACYContainerView new];
    
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
//    [self p_testEnumeration];
    
    
//    [self p_exchangeTwoObject];
//    [self p_testCountReference];
//    self.obj = [NSObject new];
//    DDLogInfo(@"self.obj:%@", self.obj);
//    
//    [self p_testPropertyAsParameter:self.obj];
    [self p_testCountReference];
	
	
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self acy_setPrefersStatusBarHidden:YES];
    
	
//	NSString *fileName = [NSString stringWithFormat:@"video%@.mp4",@(arc4random() % 1000)];
//	
//	NSString *path =
//	[NSHomeDirectory() stringByAppendingPathComponent:fileName];
//	
//	[self p_exportVideoTo:path];
}

// Because I am using the pod: MLeaksFinder, here is not a retain cycle.
// The instance will not dealloc.
// !!!: But now it really exists a retain cycle, try to solve it later.
- (BOOL)willDealloc {
    return NO;
}

#pragma mark - Private Methods

- (void)p_testPropertyAsParameter:(NSObject *)obj {
    DDLogDebug(@"In the method ---");
    DDLogInfo(@"obj in the method:%@",obj);
    obj = nil;
    DDLogWarn(@"obj is set to be nil");
    DDLogInfo(@"obj after nil:%@",obj);
    DDLogInfo(@"self.obj is now:%@",self.obj);
}

- (void)p_exportVideoTo:(NSString *)savePath {
	
	// Add parent layer
	CALayer *parentLayer = [[CALayer alloc] init];
	parentLayer.frame = CGRectMake(0, 0, ACY_SCREEN_WIDTH, ACY_SCREEN_HEIGHT);
	
	
	NSURL *URL = [[NSBundle mainBundle] URLForResource:@"" withExtension:nil];
	
	AVAsset *firstVideoAsset = [AVAsset assetWithURL:URL];
	AVAsset *secondVideoAsset = [AVAsset assetWithURL:URL];
	
	
	// prepare composition
	AVMutableComposition *composition =
	[[AVMutableComposition alloc] init];
	
	// 1.0 video
	AVMutableCompositionTrack *compositionTrack =
	[composition addMutableTrackWithMediaType:AVMediaTypeVideo
							 preferredTrackID:kCMPersistentTrackID_Invalid];
	
	
	
	CMTime duration = CMTimeMakeWithSeconds(10, 10);
	
	CMTimeRange timeRange = CMTimeRangeMake(kCMTimeZero, duration);
	
	AVAssetTrack *firstAssetTrack = [firstVideoAsset tracksWithMediaType:AVMediaTypeVideo][0];
	
	AVAssetTrack *secondAssetTrack = [secondVideoAsset tracksWithMediaType:AVMediaTypeVideo][0];
	
//	[compositionTrack insertTimeRange:timeRange
//							  ofTrack:firstAssetTrack
//							   atTime:kCMTimeZero error:nil];
	
	[compositionTrack insertTimeRanges:@[[NSValue valueWithCMTimeRange:timeRange], [NSValue valueWithCMTimeRange:timeRange]] ofTracks:@[firstAssetTrack, secondAssetTrack] atTime:kCMTimeZero error:nil];
	
//	[compositionTrack insertTimeRange:timeRange
//							  ofTrack:secondAssetTrack
//							   atTime:kCMTimeZero error:nil];
	
	
	AVPlayer *player = [AVPlayer playerWithURL:URL];
	
	AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
	
	CGRect frame = CGRectZero;
	//	frame.size = [self p_portraitSizeOfAssetTrack:firstAssetTrack];
	frame.size = CGSizeMake(100, 200);
	playerLayer.frame = parentLayer.frame;
	playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
	
	
	AVPlayer *sPlayer = [AVPlayer playerWithURL:URL];
	AVPlayerLayer *sPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:sPlayer];
	frame.origin = CGPointMake(200, 300);
//	frame.size = [self p_portraitSizeOfAssetTrack:secondAssetTrack];
	sPlayerLayer.frame = frame;
	sPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
	
	
	
	[parentLayer addSublayer:playerLayer];
	[parentLayer addSublayer:sPlayerLayer];
	
	
	AVMutableVideoCompositionLayerInstruction *videoCompositionLayerInstrucation =
	[AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:compositionTrack];
	
	
	[videoCompositionLayerInstrucation setTransform:firstAssetTrack.preferredTransform atTime:kCMTimeZero];
	[videoCompositionLayerInstrucation setOpacity:0.0 atTime:firstVideoAsset.duration];
	
	
	AVMutableVideoCompositionInstruction *videoCompostionInstruction =
	[AVMutableVideoCompositionInstruction videoCompositionInstruction];
	videoCompostionInstruction.timeRange = timeRange;
	videoCompostionInstruction.layerInstructions = @[videoCompositionLayerInstrucation];
	
	
	AVMutableVideoComposition *videoComposition =
	[AVMutableVideoComposition videoComposition];
	
	videoComposition.renderSize = parentLayer.frame.size;
	videoComposition.renderScale = 1.0;
	videoComposition.instructions = @[videoCompostionInstruction];
	videoComposition.frameDuration = CMTimeMake(1, 10);
	
	videoComposition.animationTool =
	[AVVideoCompositionCoreAnimationTool videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers:@[playerLayer, sPlayerLayer] inLayer:parentLayer];
	
	// 2.0 text layer
	
	// 3.0 image
	
	
	// Final, export to file.
	[self p_exportWithAsset:composition
		   videoComposition:videoComposition
				  outputURL:[NSURL fileURLWithPath:savePath]
				  timeRange:timeRange];


}

- (void)p_exportWithAsset:(AVAsset *)asset
		 videoComposition:(AVVideoComposition *)videoComposition
				outputURL:(NSURL *)URL
				timeRange:(CMTimeRange)timeRange {
	AVAssetExportSession *exportSession =
	[[AVAssetExportSession alloc] initWithAsset:asset
									 presetName:AVAssetExportPreset1280x720];
	
	exportSession.videoComposition = videoComposition;
	exportSession.outputFileType = AVFileTypeMPEG4;
	exportSession.outputURL = URL;
	exportSession.timeRange = timeRange;
	exportSession.shouldOptimizeForNetworkUse = YES;
	[exportSession exportAsynchronouslyWithCompletionHandler:^{
		
		
		
		if (exportSession.status == AVAssetExportSessionStatusCompleted) {
			
//			NSURL *outputURL = session.outputURL;
			ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
			if ([lib videoAtPathIsCompatibleWithSavedPhotosAlbum:URL]) {
				[lib writeVideoAtPathToSavedPhotosAlbum:URL completionBlock:^(NSURL *assetURL, NSError *error){
					dispatch_async(dispatch_get_main_queue(), ^{
//						if (error) {
//							[self showMessage:@"ERROR" details:@"Save Error" view:self.view completionBlock:nil];
//						} else {
//							[self showMessage:@"OK" details:@"Save to photo" view:self.view completionBlock:nil];
//						}
						DDLogDebug(@"Export completed");
					});
				}];
			}
			
		}
		else {
			DDLogDebug(@"Export status:%@",@(exportSession.status));
		}
	}];
}

- (CGSize)p_portraitSizeOfAssetTrack:(AVAssetTrack *)track {
	return [self p_isPortraitOfAssetTrack:track] ?
	CGSizeMake(track.naturalSize.height, track.naturalSize.width) :
	track.naturalSize;
}

- (BOOL)p_isPortraitOfAssetTrack:(AVAssetTrack *)track {
	UIImageOrientation assetOrientation = UIImageOrientationUp;
	
	BOOL isAssetPortrait = NO;
	
	CGAffineTransform transform = track.preferredTransform;
	
	if ([self p_valueInTransform:transform equalsA:0 b:1 c:-1 d:0]) {
		assetOrientation = UIImageOrientationRight;
		isAssetPortrait = YES;
	}
	else if ([self p_valueInTransform:transform equalsA:0 b:-1 c:1 d:0]) {
		assetOrientation = UIImageOrientationLeft;
		isAssetPortrait = YES;
	}
	else if ([self p_valueInTransform:transform equalsA:1 b:0 c:0 d:1]) {
		assetOrientation = UIImageOrientationUp;
	}
	else if ([self p_valueInTransform:transform equalsA:-1 b:0 c:0 d:-1]) {
		assetOrientation = UIImageOrientationDown;
	}
	
	return isAssetPortrait;
}

- (BOOL)p_valueInTransform:(CGAffineTransform)transform
				   equalsA:(CGFloat)a
						 b:(CGFloat)b
						 c:(CGFloat)c
						 d:(CGFloat)d{
	return (transform.a == a &&
			transform.b == b &&
			transform.c == c &&
			transform.d == d);
}

-(void)p_exchangeTwoObject {
    NSObject *obj1 = [NSObject new];
    NSObject *obj2 = [NSObject new];
    
    DDLogInfo(@"obj1 :%@",obj1);
    DDLogInfo(@"obj2 :%@",obj2);
    
    NSObject *temp = obj2;
    
    obj2 = obj1;
    obj1 = temp;
    
    DDLogDebug(@"After exchange");
    
    DDLogInfo(@"obj1 :%@",obj1);
    DDLogInfo(@"obj2 :%@",obj2);
    
}

-(void)p_testCountReference {
    NSObject *obj = [NSObject new];
    self.obj = obj;
    
    DDLogInfo(@"self.obj :%@",self.obj);
    DDLogInfo(@"obj :%@",obj);
    
    obj = nil;
    
    DDLogDebug(@"AFTER:---");
    DDLogInfo(@"self.obj :%@",self.obj);
    DDLogInfo(@"obj :%@",obj);
}

- (void)p_tickTack {
//    DDLogInfo(@"tick tack");
}

- (void)p_handlePanGesture:(UIPanGestureRecognizer *)pan {
    
    CGPoint point = [pan locationInView:self.view];
    
    DDLogDebug(@"Point is:%@",NSStringFromCGPoint(point));
}

- (void)p_testEnumeration {
    
    ACYCount count = ACYCountTwo;
    
    switch (count) {
            
        case ACYCountTwo: DDLogInfo(@"two");
        case ACYCountOne: DDLogInfo(@"one");
        case ACYCountZero: DDLogInfo(@"zero");
        case ACYCountThree: DDLogInfo(@"three");
    }
    
    switch (count) {
        case ACYCountZero: DDLogDebug(@"zero");
        case ACYCountOne: DDLogDebug(@"one");
        case ACYCountTwo: DDLogDebug(@"two");
        case ACYCountThree: DDLogDebug(@"three");
    }
    
    
}

#pragma mark - Properties
#pragma mark Getter

- (CADisplayLink *)timer {
	if (!_timer) {
		_timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(p_tickTack)];
		
		[_timer acy_setPreferredFramesPerSecond:1];
	}
	return _timer;
}


- (UIView *)panGestureView {
    if (!_panGestureView) {
        _panGestureView = [UIView new];

    }
    return _panGestureView;
}

@end
