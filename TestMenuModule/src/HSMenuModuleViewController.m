//
//  HSTestMenuModuleViewController.m
//  TestMenuModule
//
//  Created by Hamza Sood on 09/06/2017.
//

#import "HSMenuModuleViewController.h"

@implementation HSMenuModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGlyphImage:[UIImage imageNamed:@"MenuIcon"
                                   inBundle:[NSBundle bundleForClass:[HSMenuModuleViewController class]]
              compatibleWithTraitCollection:nil]];
    [self setTitle:@"Test Menu"];
    
    [self addActionWithTitle:@"First"  glyph:nil handler:^{ return YES; }];
    [self addActionWithTitle:@"Second" glyph:nil handler:^{ return YES; }];
    [self addActionWithTitle:@"Third"  glyph:nil handler:^{ return YES; }];
}

- (void)buttonTapped:(CCUIButtonModuleView *)button forEvent:(UIEvent *)event {
    [super buttonTapped:button forEvent:event];
    // Button tap callback
}

@end
