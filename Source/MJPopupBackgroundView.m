//
//  MJPopupBackgroundView.m
//  watched
//
//  Created by Martin Juhasz on 18.06.12.
//  Copyright (c) 2012 martinjuhasz.de. All rights reserved.
//

#import "MJPopupBackgroundView.h"

@implementation MJPopupBackgroundView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    switch (self.mode) {
        case MJPopupBackgroundModeTransparency:
            {
                CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
                CGContextSetFillColorSpace(context, colorSpace);
                CGContextSetStrokeColorSpace(context, colorSpace);
                CGContextSetRGBFillColor(context, 0.0f, 0.0f, 0.0f, self.alpha);
                CGContextSetRGBStrokeColor(context, 0.0f, 0.0f, 0.0f, self.alpha);
                CGContextFillRect(context, self.bounds);
                CGColorSpaceRelease(colorSpace);
            }
            break;
        case MJPopupBackgroundModeImage:
            {
                if (_image != nil) {
                    [_image drawInRect:rect];
                }
            }
            break;
        case MJPopupBackgroundModeImageCropped:
            {
                if (_image != nil) {
                    CGFloat const aspectRatio = rect.size.height / rect.size.width;
                    CGFloat const fitHeight = _image.size.width * aspectRatio;
                    CGFloat const fitWidth = _image.size.height / aspectRatio;

                    CGFloat x, y, width, height;
                    if (fitHeight <= _image.size.height) {
                        x = 0 * _image.scale;
                        y = (_image.size.height - fitHeight) / 2.0 * _image.scale;
                        width = _image.size.width * _image.scale;
                        height = fitHeight * _image.scale;
                    } else {
                        x = (_image.size.width - fitWidth) / 2.0 * _image.scale;
                        y = 0 * _image.scale;
                        width = fitWidth * _image.scale;
                        height = _image.size.height * _image.scale;
                    }

                    CGImageRef cgimage = _image.CGImage;
                    if (cgimage != nil) {
                        CGRect const cropRect = CGRectMake(x, y, width, height);
                        CGImageRef cropped = CGImageCreateWithImageInRect(cgimage, cropRect);
                        if (cropped != nil) {
                            UIImage *img = [UIImage imageWithCGImage:cropped
                                                               scale:_image.scale
                                                         orientation:_image.imageOrientation];
                            if (img != nil) {
                                [img drawInRect:rect];
                            }
                            CGImageRelease(cropped);
                        }
                    }
                }
            }
            break;
        case MJPopupBackgroundModeRadialGradation:
        default:
            {
                size_t locationsCount = 2;
                CGFloat locations[2] = {0.0f, 1.0f};
                CGFloat colors[8] = {0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,self.alpha};
                CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
                CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
                CGColorSpaceRelease(colorSpace);
                
                CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
                float radius = MIN(self.bounds.size.width , self.bounds.size.height) ;
                CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
                CGGradientRelease(gradient);
            }
            break;
    }
}


@end
