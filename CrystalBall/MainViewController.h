//
//  ViewController.h
//  CrystalBall
//
//  Created by Amir Ghoreshi on 26/10/14.
//  Copyright (c) 2014 Netlight. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CrystalBall;

@interface MainViewController : UIViewController 

 //- (IBAction)buttonPressed;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel* predictionLabel;
@property (strong, nonatomic) CrystalBall* crystalBall;
- (void) randomPrediction;
@end

