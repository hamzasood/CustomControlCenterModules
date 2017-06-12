//
//  HSCustomUIModuleAnimationView.h
//  TestCustomUIModule
//
//  Created by Hamza Sood on 12/06/2017.
//

#import <UIKit/UIKit.h>

/// This view displays an animation for the images in the "Animation Images" folder.
/// This is done manually as opposed to using a UIImageView to allow for changing the speed
/// without restarting the animation from the beginning.
@interface HSCustomUIModuleAnimationView : UIView
- (void)startAnimating;
- (void)stopAnimating;
@property (nonatomic, readonly) BOOL isAnimating;
@property (nonatomic) CGFloat framesPerSecond;
@end
