//
//  CrystalBall.m
//  CrystalBall
//
//  Created by Amir Ghoreshi on 26/10/14.
//  Copyright (c) 2014 Netlight. All rights reserved.
//

#import "CrystalBall.h"

@interface CrystalBall ()
// define private properties
// define private methods
@end

@implementation CrystalBall {

    //priv
    
}

- (NSArray *) predictions {
    
    if (_predictions == nil) {
        _predictions = [[NSArray alloc] initWithObjects:@"It is Certain",@"Do it",@"Nope",@"Ok",@"Why not!", @"You can't do it",@"Fuck it", @"Kjør på!", nil];
    }
    return _predictions;
}

- (NSArray *) colors {
    
    if (_colors == nil) {
        _colors = [[NSArray alloc] initWithObjects: [UIColor redColor], [UIColor blueColor], [UIColor blackColor], nil];
    }
    return _colors;
}

-(int) getRandomIndex:(int)max {
    return arc4random_uniform(max);
}

-(NSString *) randomPrediction {
    return [self.predictions objectAtIndex:[self getRandomIndex:(int)self.predictions.count]];
}
- (UIColor *) randomColor {
    return [self.colors objectAtIndex:[self getRandomIndex:(int)self.colors.count]];
}

@end
