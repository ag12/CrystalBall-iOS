//
//  CrystalBall.h
//  CrystalBall
//
//  Created by Amir Ghoreshi on 26/10/14.
//  Copyright (c) 2014 Netlight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CrystalBall : NSObject {
    NSArray* _predictions;
    NSArray* _colors;
}
- (int) getRandomIndex:(int)max;
- (NSString *) randomPrediction;
- (UIColor *) randomColor;

@end
