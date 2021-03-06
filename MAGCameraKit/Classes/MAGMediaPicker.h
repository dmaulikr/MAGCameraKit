//
//  ITMediaPicker.h
//  InTouch
//
//  Created by Evgeniy Stepanov on 01/12/16.
//  Copyright © 2016 magora-system. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAGMediaPickerItem.h"
#import "MAGMediaPickerStringsProtocol.h"

typedef void(^PickedMediaItem)(MAGMediaPickerItem *item);

@interface MAGMediaPicker : NSObject

@property (strong, nonatomic) id<MAGMediaPickerStringsProtocol> strings;

- (instancetype)initWithVC:(UIViewController *)vc;
- (void)pickMedia:(PickedMediaItem)completion;

@end
