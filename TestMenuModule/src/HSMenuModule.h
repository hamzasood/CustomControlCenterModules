//
//  HSTestMenuModule.h
//  TestMenuModule
//
//  Created by Hamza Sood on 09/06/2017.
//

#import <ControlCenterUIKit/ControlCenterUIKit.h>
#import "HSMenuModuleViewController.h"

@interface HSMenuModule : NSObject <CCUIContentModule>
@property (strong, nonatomic) HSMenuModuleViewController *contentViewController;
@end
