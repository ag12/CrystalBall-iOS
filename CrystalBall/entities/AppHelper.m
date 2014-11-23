//
//  AppHelper.m
//  CrystalBall
//
//  Created by Amir Ghoreshi on 02/11/14.
//  Copyright (c) 2014 Netlight. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

+ (NSArray *) getImageArray {
    
    NSMutableArray* ma = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 60; i++) {
        NSString* s = [NSString stringWithFormat:@"%d", i];
        if([s length] == 1){
            s = [NSString stringWithFormat:@"0%@", s];
        }
        [ma addObject:[UIImage imageNamed:[NSString stringWithFormat:@"CB000%@",s]]];
    }
    return [NSArray arrayWithArray: ma];
}

@end
