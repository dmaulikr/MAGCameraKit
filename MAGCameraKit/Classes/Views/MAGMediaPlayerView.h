//
//  MAGMediaPlayerView.h
//  Pods
//
//  Created by Stepanov Evgeniy on 21/07/2017.
//
//

#import <MAGCameraKit/MAGCameraKit.h>
#include "SCRecorder.h"


@interface MAGMediaPlayerView : SCVideoPlayerView

- (void)showImage:(UIImage *)image;
- (void)hideImage;

@end