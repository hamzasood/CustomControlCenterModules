//
//  HSCustomUIModuleAnimationView.m
//  TestCustomUIModule
//
//  Created by Hamza Sood on 12/06/2017.
//

#import "HSCustomUIModuleAnimationView.h"


static NSArray<UIImage *> *animationImages;

static void InitAnimationImages(NSBundle *bundle) {
    NSArray *animationImagePaths = [[bundle pathsForResourcesOfType:@"png" inDirectory:@"Animation Images"]
                                    sortedArrayUsingComparator:^NSComparisonResult(NSString * _Nonnull obj1, NSString * _Nonnull obj2) {
                                        return [obj1 compare:obj2 options:(NSCaseInsensitiveSearch | NSNumericSearch)];
                                    }];;
    
    NSMutableArray *mutableImages = [NSMutableArray arrayWithCapacity:animationImagePaths.count];
    for (NSString *path in animationImagePaths)
        [mutableImages addObject:[UIImage imageWithContentsOfFile:path]];
    
    animationImages = [mutableImages copy];
}


@implementation HSCustomUIModuleAnimationView {
    UIImageView *_imageView;
    
    NSTimer *_timer;
    int _currentFrame;
}

@dynamic isAnimating;

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        _currentFrame = 0;
        _framesPerSecond = 24;
        
        _imageView = [[UIImageView alloc]initWithFrame:frame];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_imageView];
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            InitAnimationImages([NSBundle bundleForClass:self.class]);
        });
    }
    return self;
}

- (void)startAnimating {
    NSAssert(!self.isAnimating, @"Trying to start animating when the animation is already going");
    _timer = [NSTimer scheduledTimerWithTimeInterval:1/_framesPerSecond
                                              target:self selector:@selector(animationTick)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)stopAnimating {
    NSAssert(self.isAnimating, @"Trying to stop animating, but there's no animation to stop");
    [_timer invalidate];
    _timer = nil;
}

- (void)animationTick {
    ++_currentFrame;
    if (_currentFrame >= animationImages.count)
        _currentFrame = 0;
    
    _imageView.image = animationImages[_currentFrame];
}

- (BOOL)isAnimating {
    return _timer != nil;
}

- (void)setFramesPerSecond:(CGFloat)framesPerSecond {
    _framesPerSecond = framesPerSecond;
    if (self.isAnimating) {
        [self stopAnimating];
        [self startAnimating];
    }
}

@end
