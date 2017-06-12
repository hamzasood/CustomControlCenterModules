//
//  HSCustomUIModuleBackgroundViewController.m
//  TestCustomUIModule
//
//  Created by Hamza Sood on 12/06/2017.
//

#import "HSCustomUIModuleBackgroundViewController.h"
#import <ControlCenterUIKit/ControlCenterUIKit.h>

static const CGFloat kLabelToSliderVerticalSpace = 8;
static const CGFloat kSliderHorizontalSpace = 50;
static const CGFloat kSliderVerticalSpace = 50;

@implementation HSCustomUIModuleBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CCUIControlCenterLabel *label = [[CCUIControlCenterLabel alloc]initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = @"Animation Speed:";
    [self.view addSubview:label];
    
    UISlider *fpsSlider = [[UISlider alloc]initWithFrame:CGRectZero];
    fpsSlider.translatesAutoresizingMaskIntoConstraints = NO;
    fpsSlider.tintColor = UIColor.whiteColor;
    fpsSlider.minimumValue = 5;
    fpsSlider.maximumValue = 50;
    fpsSlider.value = 24;
    fpsSlider.continuous = NO;
    [fpsSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:fpsSlider];
    
    void(^activateVisualConstraint)(NSString *) = ^(NSString *constraintStr) {
        NSDictionary *viewsDict = NSDictionaryOfVariableBindings(fpsSlider,
                                                                 label);
        NSDictionary *metricsDict = @{@"kLabelToSliderVerticalSpace": @(kLabelToSliderVerticalSpace),
                                      @"kSliderHorizontalSpace":      @(kSliderHorizontalSpace),
                                      @"kSliderVerticalSpace":        @(kSliderVerticalSpace)};
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintStr
                                                                                        options:0
                                                                                        metrics:metricsDict
                                                                                          views:viewsDict]];
    };
    
    activateVisualConstraint(@"V:[label]-(kLabelToSliderVerticalSpace)-[fpsSlider]-(kSliderVerticalSpace)-|");
    activateVisualConstraint(@"|-(kSliderHorizontalSpace)-[fpsSlider]-(kSliderHorizontalSpace)-|");
    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view attribute:NSLayoutAttributeCenterX
                                                                          multiplier:1 constant:0]]];
}

- (void)sliderChanged:(UISlider *)slider {
    [_delegate backgroundViewController:self fpsChanged:slider.value];
}

@end
