//
//  UIImageView+RWCornerRadius.m
//  Demo
//
//  Created by 许宗城 on 16/7/9.
//  Copyright © 2016年 许宗城. All rights reserved.
//

#import "UIImageView+RWCornerRadius.h"
#import <objc/runtime.h>


@interface UIImageView ()

@property (nonatomic, assign) BOOL rw_enableCornerRadius;

@property (nonatomic, strong) UIImage *rw_imageTmp;

@property (nonatomic, assign) BOOL rw_frameValid;

@end

@implementation UIImageView (RWCornerRadius)

#pragma mark - Public

- (void)setRw_cornerRadius:(CGFloat)rw_cornerRadius {
    objc_setAssociatedObject(self, @selector(rw_cornerRadius), @(rw_cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.rw_enableCornerRadius = YES;
    
    static dispatch_once_t setImagePredicate;
    static dispatch_once_t layoutSubviewsPredicate;
    [[self class] rw_swizzleMethod:@selector(setImage:) withAnotherMethod:@selector(rw_setImage:) predicate:&setImagePredicate];
    [[self class] rw_swizzleMethod:@selector(layoutSubviews) withAnotherMethod:@selector(rw_layoutSubviews) predicate:&layoutSubviewsPredicate];
    
    
    if (self.image) {
        self.image = self.image;
    }
}

- (CGFloat)rw_cornerRadius {
    return [objc_getAssociatedObject(self, @selector(rw_cornerRadius)) floatValue];
}


#pragma mark - Private

+ (void)rw_swizzleMethod:(SEL)oriSEL withAnotherMethod:(SEL)newSEL predicate:(dispatch_once_t *)predicate {
    dispatch_once(predicate, ^{
        Method oriMethod = class_getInstanceMethod(self, oriSEL);
        Method newMethod = class_getInstanceMethod(self, newSEL);
        method_exchangeImplementations(oriMethod, newMethod);
    });
}

- (void)rw_layoutSubviews {
    [self rw_layoutSubviews];
    
    if (self.rw_enableCornerRadius) {
        if (self.frame.size.width > 0 && self.rw_cornerRadius > 0) {
            self.rw_frameValid = YES;
            if (self.rw_imageTmp) {
                [self rw_drawImage];
            }
        }
    }
}

- (void)rw_setImage:(UIImage *)image {
    if (self.rw_enableCornerRadius) {
        self.rw_imageTmp = image;
        if (self.rw_frameValid) {
            [self rw_drawImage];
        }
    } else {
        [self rw_setImage:image];
    }
}

- (void)rw_drawImage {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIImage *image = self.rw_imageTmp;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(size, NO, scale);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.rw_cornerRadius];
        [path addClip];
        [image drawInRect:self.bounds];
        UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (image == self.rw_imageTmp) {
                [self rw_setImage:processedImage];
            }
        });
    });
    
    //    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    //    if (!UIGraphicsGetCurrentContext()) {
    //        return;
    //    }
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.rw_cornerRadius];
    //    [path addClip];
    //    [image drawInRect:self.bounds];
    //    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //
    //    [self rw_setImage:processedImage];
}


#pragma mark - Extension Property

- (void)setRw_imageTmp:(UIImage *)rw_imageTmp {
    objc_setAssociatedObject(self, @selector(rw_imageTmp), rw_imageTmp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)rw_imageTmp {
    return objc_getAssociatedObject(self, @selector(rw_imageTmp));
}

- (void)setRw_frameValid:(BOOL)rw_frameValid {
    objc_setAssociatedObject(self, @selector(rw_frameValid), @(rw_frameValid), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)rw_frameValid {
    return [objc_getAssociatedObject(self, @selector(rw_frameValid)) boolValue];
}

- (void)setRw_enableCornerRadius:(BOOL)rw_enableCornerRadius {
    objc_setAssociatedObject(self, @selector(rw_enableCornerRadius), @(rw_enableCornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)rw_enableCornerRadius {
    return [objc_getAssociatedObject(self, @selector(rw_enableCornerRadius)) boolValue];
}


@end
