//
//  HSCustomUIModuleContentViewController.m
//  TestCustomUIModule
//
//  Created by Hamza Sood on 11/06/2017.
//

#import "HSCustomUIModuleContentViewController.h"
#import "HSCustomUIModuleAnimationView.h"


// Space between the left edge of the expanded button and the left edge of the screen.
// The button will be centered, so the right side will have the same gap.
static const CGFloat kExpandedWidthEdgeGap = 20;

// height:width ratio for the expanded button.
// This is essentially the inverse of the aspect ratio, specified as such because
// the height needs to be calculated from the width.
static const CGFloat kExpandedHeightToWidthRatio = 0.75;

// Inset amount for the image view when the button is expanded.
// Equivalent to the following constraints (horizontal and vertical):
// |-(inset)-[imageView]-(inset)-|
static const CGFloat kExpandedImageViewInset = 25;




@implementation HSCustomUIModuleContentViewController {
    HSCustomUIModuleAnimationView *_animationImageView;
}

@dynamic animationFramesPerSecond;


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *thisBundle = [NSBundle bundleForClass:self.class];
    
    self.glyphPackage = [CAPackage ccuiPackageNamed:@"ButtonGlyph" inBundle:thisBundle];
    self.selected = NO;
    
    _animationImageView = [[HSCustomUIModuleAnimationView alloc]initWithFrame:CGRectZero];
    _animationImageView.alpha = 0;
    [self.view addSubview:_animationImageView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Set the image view to be the same size as the button.
    // This won't matter initially, since the image view is hidden until the button is expanded.
    // However it's a sensible starting point for the expansion animation.
    _animationImageView.frame = (CGRect){.origin = CGPointZero,
                                         .size = self.view.bounds.size};
}


#pragma mark - CCUIContentModuleContentViewController Protocol

- (CGFloat)preferredExpandedContentWidth {
    return UIScreen.mainScreen.bounds.size.width - 2*kExpandedWidthEdgeGap;
}

- (CGFloat)preferredExpandedContentHeight {
    return self.preferredExpandedContentWidth * kExpandedHeightToWidthRatio;
}


#pragma - Animation

- (CGFloat)animationFramesPerSecond {
    return _animationImageView.framesPerSecond;
}

- (void)setAnimationFramesPerSecond:(CGFloat)animationFramesPerSecond {
    _animationImageView.framesPerSecond = animationFramesPerSecond;
}


#pragma mark - Selection Handling

- (void)setSelected:(BOOL)selected {
    super.selected = selected;
    self.glyphState = (selected ? @"on" : @"off");
}

- (void)buttonTapped:(UIControl *)buttonView forEvent:(UIEvent *)event {
    self.selected = !self.selected;
}


#pragma mark - Transition Animation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if (self.isExpanded) {
            // Expand animation
            _animationImageView.alpha = 1.0;
            _animationImageView.frame = (CGRect){.origin.x = kExpandedImageViewInset,
                                                 .origin.y = kExpandedImageViewInset,
                                                 .size.width  = size.width - 2*kExpandedImageViewInset,
                                                 .size.height = size.height - 2*kExpandedImageViewInset};
            [_animationImageView startAnimating];
        }
        else {
            // Collapse animation
            _animationImageView.alpha = 0.0;
            _animationImageView.frame = (CGRect){.origin = CGPointZero,
                                                 .size = size};
            [_animationImageView stopAnimating];
        }
    } completion:nil];
}

@end
