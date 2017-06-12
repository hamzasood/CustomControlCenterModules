//
//  HSCustomUIModuleBackgroundViewController.h
//  TestCustomUIModule
//
//  Created by Hamza Sood on 12/06/2017.
//

#import <UIKit/UIKit.h>

@class HSCustomUIModuleBackgroundViewController;
@protocol HSCustomUIModuleBackgroundViewControllerDelegate
- (void)backgroundViewController:(HSCustomUIModuleBackgroundViewController *)backgroundViewController
                      fpsChanged:(CGFloat)newFps;
@end

@interface HSCustomUIModuleBackgroundViewController : UIViewController
@property (weak, nonatomic) id<HSCustomUIModuleBackgroundViewControllerDelegate> delegate;
@end
