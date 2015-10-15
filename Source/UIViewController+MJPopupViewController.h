//
//  UIViewController+MJPopupViewController.h
//  MJModalViewController
//
//  Created by Martin Juhasz on 11.05.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJPopupBackgroundView;

typedef enum MJPopupViewAnimation {
    MJPopupViewAnimationFade = 0,
    MJPopupViewAnimationSlideBottomTop = 1,
    MJPopupViewAnimationSlideBottomBottom,
    MJPopupViewAnimationSlideTopTop,
    MJPopupViewAnimationSlideTopBottom,
    MJPopupViewAnimationSlideLeftLeft,
    MJPopupViewAnimationSlideLeftRight,
    MJPopupViewAnimationSlideRightLeft,
    MJPopupViewAnimationSlideRightRight,
} MJPopupViewAnimation;

typedef enum MJPopupBackgroundMode {
    MJPopupBackgroundModeTransparency = 0,
    MJPopupBackgroundModeRadialGradation,
    MJPopupBackgroundModeImage,
    MJPopupBackgroundModeImageCropped,
} MJPopupBackgroundMode;

@interface UIViewController (MJPopupViewController)

@property (nonatomic, retain, nullable) UIViewController *mj_popupViewController;
@property (nonatomic, retain, nullable) MJPopupBackgroundView *mj_popupBackgroundView;

- (void)presentPopupViewController:(nonnull UIViewController*)popupViewController animationType:(MJPopupViewAnimation)animationType;
- (void)presentPopupViewController:(nonnull UIViewController*)popupViewController animationType:(MJPopupViewAnimation)animationType dismissed:(nullable void(^)(void))dismissed;
- (void)presentPopupViewController:(nonnull UIViewController*)popupViewController animationType:(MJPopupViewAnimation)animationType backgroundMode:(MJPopupBackgroundMode)mode backgroundAlpha:(CGFloat)alpha dontDismissByTouchUpOutside:(BOOL)dontDismissByTouchUpOutside dismissed:(nullable void(^)(void))dismissed;
- (void)presentPopupViewController:(nonnull UIViewController*)popupViewController animationType:(MJPopupViewAnimation)animationType backgroundMode:(MJPopupBackgroundMode)mode backgroundImage:(nonnull UIImage*)image dontDismissByTouchUpOutside:(BOOL)dontDismissByTouchUpOutside dismissed:(nullable void(^)(void))dismissed;
- (void)dismissPopupViewControllerWithanimationType:(MJPopupViewAnimation)animationType;

@end
