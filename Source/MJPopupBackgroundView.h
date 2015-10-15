//
//  MJPopupBackgroundView.h
//  watched
//
//  Created by Martin Juhasz on 18.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MJPopupViewController.h"

@interface MJPopupBackgroundView : UIView

@property (nonatomic) CGFloat alpha;
@property (nonatomic) MJPopupBackgroundMode mode;
@property (nonatomic, strong, nullable, retain) UIImage *image;

@end
