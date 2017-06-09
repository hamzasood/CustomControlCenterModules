//
//  HSTestMenuModule.m
//  TestMenuModule
//
//  Created by Hamza Sood on 09/06/2017.
//

#import "HSMenuModule.h"

@implementation HSMenuModule

- (instancetype)init {
    if ((self = [super init])) {
        _contentViewController = [[HSMenuModuleViewController alloc]init];
    }
    return self;
}

@end
