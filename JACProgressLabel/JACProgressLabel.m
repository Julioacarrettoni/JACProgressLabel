//
//  JACProgressLabel.m
//  Demo
//
//  Created by Julio Carrettoni on 5/25/14.
//  Copyright (c) 2014 Julio Carrettoni. All rights reserved.
//

#import "JACProgressLabel.h"

@implementation JACProgressLabel {
    UIView* progressView;
    
    UILabel* unloadedLabel;
    UILabel* loadedLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createContent];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self createContent];
}

-(void) createContent {
    self.backgroundColor = [UIColor clearColor];
    progressView = [[UIView alloc] initWithFrame:self.bounds];
    progressView.backgroundColor = [UIColor clearColor];
    progressView.clipsToBounds = YES;
    
    loadedLabel = [[UILabel alloc] initWithFrame:self.bounds];
    unloadedLabel = [[UILabel alloc] initWithFrame:self.bounds];
    
    loadedLabel.textAlignment = NSTextAlignmentCenter;
    unloadedLabel.textAlignment = NSTextAlignmentCenter;
    unloadedLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    [self setProgress:0.0
              andText:@""
             withFont:[UIFont systemFontOfSize:MAX(14.0, self.frame.size.height/2.5)]
  withLoadedTextColor:[UIColor whiteColor]
 andUnloadedTextColor:[UIColor blackColor]
    withLoadedBGColor:[UIColor blackColor]
   andUnloadedBGColor:[UIColor whiteColor]];
    
    [self addSubview:loadedLabel];
    [self addSubview:progressView];
    [progressView addSubview:unloadedLabel];
}


- (void) setProgress:(float) progress {
    [self setProgress:progress andText:_text];
}

- (void) setText:(NSString*) text {
    [self setProgress:_progress andText:text];
}

- (void) setProgress:(float) progress andText:(NSString*) text {
    _progress = MAX(0.0, MIN(progress, 1.0));
    _text = text;
    
    loadedLabel.text = text;
    unloadedLabel.text = text;
    
    CGRect frame = progressView.frame;
    
    frame.size.width = floor(self.frame.size.width * (1.0 -progress));
    frame.origin.x = ceil(self.frame.size.width * (progress));
    
    progressView.frame = frame;
}

- (void) setProgress:(float)progress andText:(NSString *)text withFont:(UIFont*) font withLoadedTextColor:(UIColor*) loadedTextColor andUnloadedTextColor:(UIColor*) unloadedTextColor withLoadedBGColor:(UIColor*) loadedBackgroundColor andUnloadedBGColor:(UIColor*) unloadedBackgroundColor {
    [self setProgress:progress andText:text];
    [self setTextFont:font];
    [self setLoadedTextColor:loadedTextColor];
    [self setUnloadedTextColor:unloadedTextColor];
    [self setLoadedBackgroundColor:loadedBackgroundColor];
    [self setUnloadedBackgroundColor:unloadedBackgroundColor];
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    loadedLabel.font = textFont;
    unloadedLabel.font = textFont;
}

- (void) setLoadedTextColor:(UIColor *)loadedTextColor {
    _loadedTextColor = loadedTextColor;
    loadedLabel.textColor = loadedTextColor;
}

- (void)setUnloadedTextColor:(UIColor *)unloadedTextColor {
    _unloadedTextColor = unloadedTextColor;
    unloadedLabel.textColor = unloadedTextColor;
}

- (void)setLoadedBackgroundColor:(UIColor *)loadedBackgroundColor {
    _loadedBackgroundColor = loadedBackgroundColor;
    loadedLabel.backgroundColor = loadedBackgroundColor;
}

- (void)setUnloadedBackgroundColor:(UIColor *)unloadedBackgroundColor {
    _unloadedBackgroundColor = unloadedBackgroundColor;
    unloadedLabel.backgroundColor = unloadedBackgroundColor;
}

@end