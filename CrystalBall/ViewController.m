//
//  ViewController.m
//  CrystalBall
//
//  Created by Amir Ghoreshi on 26/10/14.
//  Copyright (c) 2014 Netlight. All rights reserved.
//

#import "ViewController.h"
#import "CrystalBall.h"

#import "AppHelper.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()
@end

@implementation ViewController {

    SystemSoundID soundEffect;
}
#pragma mark - Self


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.crystalBall = [[CrystalBall alloc] init];

    
    self.backgroundImageView.animationImages = [AppHelper getImageArray];
    self.backgroundImageView.animationDuration = 2.5f;
    self.backgroundImageView.animationRepeatCount = 1;
    
    NSString *soundPaht = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPaht];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundUrl), &soundEffect);
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Prediction Events

- (void) clearPrediction {
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0f;
}

- (void) randomPrediction {
    [self.backgroundImageView startAnimating];
    self.predictionLabel.text = [self.crystalBall randomPrediction];
    self.predictionLabel.textColor = [self.crystalBall randomColor];
    [UIView animateWithDuration:4.0 animations:^{
        self.predictionLabel.alpha = 1.0f;
    }];
    AudioServicesPlayAlertSound(soundEffect);
}

- (int) getRandomNum:(int)max {
    return arc4random_uniform(max);
}

/*
 - (IBAction)buttonPressed {
 [self randomPrediction];
 }
 
 */

#pragma mark - Motions Events

// MOTIONS
- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [self clearPrediction];
    NSLog(@"Motion began");
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self randomPrediction];
    }
    NSLog(@"Motion motionEnded");
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"Motion motionCancelled");
}

#pragma mark - Motions Events


//TOUCHES

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self clearPrediction];
    NSLog(@"Touches touchesBegan");
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self randomPrediction];
    NSLog(@"Touches touchesEnded");
}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches touchesCancelled");
}
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touches touchesMoved");

}

@end
