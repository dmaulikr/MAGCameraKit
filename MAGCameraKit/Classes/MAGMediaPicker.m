//
//  ITMediaPicker.m
//  InTouch
//
//  Created by Evgeniy Stepanov on 01/12/16.
//  Copyright © 2016 magora-system. All rights reserved.
//

#import "MAGMediaPicker.h"
#import "MAGCameraViewController.h"
#import "MAGMediaPickerViewController.h"
#import "MAGCameraKitCommon.h"


@interface MAGMediaPicker ()
@property (weak, nonatomic) UIViewController *ownerVC;
@end


@implementation MAGMediaPicker


- (instancetype)initWithVC:(UIViewController *)vc {
    if (self = [super init]) {
        self.ownerVC = vc;
    }
    
    return self;
}



- (void)pickMedia:(PickedMediaItem)completion {
    MAGMediaPickerViewController *cameraVC = [self loadCameraVC];
    cameraVC.presenter = [MAGMediaPickerPresenter new];
    cameraVC.strings = self.strings;
    
    [self.ownerVC presentViewController:cameraVC animated:YES completion:nil];

    @weakify(cameraVC);
    [cameraVC.presenter setCompletion:^(MAGMediaPickerItem *item) {
        @strongify(cameraVC);
        [cameraVC dismissViewControllerAnimated:YES completion:nil];

        if (completion) {
            completion(item);
        }
    }];
}


- (MAGMediaPickerViewController *)loadCameraVC {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"CameraFlow" bundle:bundle];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return (MAGMediaPickerViewController *)vc;
}


@end
