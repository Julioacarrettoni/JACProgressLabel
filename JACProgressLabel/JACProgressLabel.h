//
//  JACProgressLabel.h
//  Demo
//
//  Created by Julio Carrettoni on 5/25/14.
//  Copyright (c) 2014 Julio Carrettoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JACProgressLabel : UIView

- (void) setProgress:(float) progress;
- (void) setText:(NSString*) text;
- (void) setProgress:(float) progress andText:(NSString*) text;

- (void) setProgress:(float)progress andText:(NSString *)text withFont:(UIFont*) font withLoadedTextColor:(UIColor*) loadedTextColor andUnloadedTextColor:(UIColor*) unloadedTextColor withLoadedBGColor:(UIColor*) loadedBackgroundColor andUnloadedBGColor:(UIColor*) unloadedBackgroundColor;

@property (nonatomic, assign) float progress;

@property (nonatomic, assign) NSString* text;
@property (nonatomic, assign) UIFont* textFont;

@property (nonatomic, assign) UIColor* loadedTextColor;
@property (nonatomic, assign) UIColor* unloadedTextColor;

@property (nonatomic, assign) UIColor* loadedBackgroundColor;
@property (nonatomic, assign) UIColor* unloadedBackgroundColor;

@end
