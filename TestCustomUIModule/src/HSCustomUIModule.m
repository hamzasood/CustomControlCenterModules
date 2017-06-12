//
//  HSCustomUIModule.m
//  TestCustomUIModule
//
//  Created by Hamza Sood on 11/06/2017.
//

#import "HSCustomUIModule.h"

@implementation HSCustomUIModule

- (instancetype)init {
    if ((self = [super init])) {
        _contentViewController = [[HSCustomUIModuleContentViewController alloc]init];
        
        _backgroundViewController = [[HSCustomUIModuleBackgroundViewController alloc]init];
        _backgroundViewController.delegate = self;
    }
    return self;
}

- (void) backgroundViewController:(HSCustomUIModuleBackgroundViewController *)backgroundViewController
                       fpsChanged:(CGFloat)newFps {
    _contentViewController.animationFramesPerSecond = newFps;
}

@end
