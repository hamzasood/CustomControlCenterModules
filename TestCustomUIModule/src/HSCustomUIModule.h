//
//  HSCustomUIModule.h
//  TestCustomUIModule
//
//  Created by Hamza Sood on 11/06/2017.
//

#import <ControlCenterUIKit/ControlCenterUIKit.h>

#import "HSCustomUIModuleContentViewController.h"
#import "HSCustomUIModuleBackgroundViewController.h"

@interface HSCustomUIModule : NSObject <CCUIContentModule, HSCustomUIModuleBackgroundViewControllerDelegate>
@property(readonly, nonatomic) HSCustomUIModuleContentViewController *contentViewController;
@property(readonly, nonatomic) HSCustomUIModuleBackgroundViewController *backgroundViewController;
@end
