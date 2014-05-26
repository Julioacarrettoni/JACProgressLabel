//
//  MainViewController.m
//  Demo
//
//  Created by Julio Carrettoni on 5/25/14.
//  Copyright (c) 2014 Julio Carrettoni. All rights reserved.
//

#import "MainViewController.h"
#import "JACProgressLabel.h"
#import "UIColor+MLPFlatColors.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet JACProgressLabel *progressLabel1;
@property (weak, nonatomic) IBOutlet JACProgressLabel *progressLabel2;
@property (weak, nonatomic) IBOutlet JACProgressLabel *progressLabel3;
@property (weak, nonatomic) IBOutlet JACProgressLabel *progressLabel4;
@property (weak, nonatomic) IBOutlet JACProgressLabel *progressLabel5;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.progressLabel1.text = @"Static Text";
    
    [self.progressLabel2 setProgress:0
                             andText:@""
                            withFont:[UIFont boldSystemFontOfSize:16]
                 withLoadedTextColor:[UIColor flatRedColor]
                andUnloadedTextColor:[UIColor flatYellowColor]
                   withLoadedBGColor:[UIColor flatBlueColor]
                  andUnloadedBGColor:[UIColor brownColor]];

    [self.progressLabel3 setProgress:0
                             andText:@""
                            withFont:[UIFont boldSystemFontOfSize:16]
                 withLoadedTextColor:[UIColor flatRedColor]
                andUnloadedTextColor:[UIColor flatRedColor]
                   withLoadedBGColor:[UIColor flatYellowColor]
                  andUnloadedBGColor:[UIColor whiteColor]];
    
    [self.progressLabel3 setProgress:0
                             andText:@""
                            withFont:[UIFont boldSystemFontOfSize:16]
                 withLoadedTextColor:[UIColor flatRedColor]
                andUnloadedTextColor:[UIColor flatRedColor]
                   withLoadedBGColor:[UIColor flatYellowColor]
                  andUnloadedBGColor:[UIColor whiteColor]];
    
    [self.progressLabel4 setProgress:0
                             andText:@""
                            withFont:[UIFont boldSystemFontOfSize:22]
                 withLoadedTextColor:[UIColor whiteColor]
                andUnloadedTextColor:[UIColor flatBlueColor]
                   withLoadedBGColor:[UIColor flatBlueColor]
                  andUnloadedBGColor:[UIColor whiteColor]];
    
    [self.progressLabel5 setProgress:0
                             andText:@"The loading is indicated in the text :)"
                            withFont:[UIFont boldSystemFontOfSize:16]
                 withLoadedTextColor:[UIColor blackColor]
                andUnloadedTextColor:[UIColor whiteColor]
                   withLoadedBGColor:[UIColor flatOrangeColor]
                  andUnloadedBGColor:[UIColor flatOrangeColor]];

    self.progressLabel3.layer.borderWidth = 1.0;
    self.progressLabel3.layer.borderColor = [UIColor blackColor].CGColor;
    self.progressLabel3.layer.cornerRadius = 10.0;
    self.progressLabel3.layer.masksToBounds = YES;

    self.progressLabel4.layer.borderWidth = 2.0;
    self.progressLabel4.layer.borderColor = [UIColor flatBlueColor].CGColor;
    
    self.progressLabel5.layer.borderWidth = 1.0;
    self.progressLabel5.layer.borderColor = [UIColor blackColor].CGColor;
    self.progressLabel5.layer.cornerRadius = 2.0;
    self.progressLabel5.layer.masksToBounds = YES;
    
    
    [self onSliderValueChange:self.slider];
}

- (IBAction)onSliderValueChange:(UISlider *)sender {
    
    NSString* dinamicText1 = [NSString stringWithFormat:@"Dinamic Text (%.0f%%)", sender.value*100];
    
    self.progressLabel1.progress = sender.value;
    
    [self.progressLabel2 setProgress:sender.value andText:dinamicText1];
    [self.progressLabel3 setProgress:sender.value andText:dinamicText1];
    
    if (sender.value < 0.25)
        dinamicText1 = @"Starting loading";
    else if (sender.value < 0.5)
        dinamicText1 = @"Making good progress";
    else if (sender.value < 0.75)
        dinamicText1 = @"Half way done!";
    else if (sender.value < 1.0)
        dinamicText1 = @"Almost done…";
    else
        dinamicText1 = @"DONE!";
    
    [self.progressLabel4 setProgress:sender.value andText:dinamicText1];
    
    self.progressLabel5.progress = sender.value;
}

@end
