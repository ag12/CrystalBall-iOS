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
#import "Logging.h"

@interface ViewController ()
@end

@implementation ViewController {
    @private
    SystemSoundID soundEffect;
}

#pragma mark - Delegate

- (void)viewDidLoad {
    [super viewDidLoad];
    self.crystalBall = [CrystalBall new];
    [self setStyle];
    [self setSoundSettings];
}
#pragma mark - Style
- (void)setStyle {
    self.backgroundImageView.animationImages = [AppHelper getImageArray];
    self.backgroundImageView.animationDuration = 2.5f;
    self.backgroundImageView.animationRepeatCount = 1;
}
#pragma mark - Sound

- (void)setSoundSettings {

    NSString *soundPaht = [[NSBundle mainBundle] pathForResource:@"crystal_ball" ofType:@"mp3"];
    NSURL *soundUrl = [NSURL fileURLWithPath:soundPaht];
    AudioServicesCreateSystemSoundID(CFBridgingRetain(soundUrl), &soundEffect);
    AudioServicesPlayAlertSound(soundEffect);
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
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self randomPrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
}

#pragma mark - Motions Events


//TOUCHES
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self clearPrediction];
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self randomPrediction];
}
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {}
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {}

@end
