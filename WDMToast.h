//
//  WDMToast.h
//
//
//  Created by lei_dream on 15/5/28.
//  Copyright (c) 2015年 lei_dream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define DEFAULTSIZE  CGSizeMake(DefauleWidth, Defauleheight) //toast大小
#define DEFAULTFRAME CGRectMake(65, 130, DefauleWidth, Defauleheight) //toast位置
static const CGFloat Defaultduration = 2.0f;      //默认显示时间
static const CGFloat DefauleWidth = 200;
static const CGFloat Defauleheight = 100;

typedef NS_ENUM(NSInteger, TOASTPOSITION){ //位置
    ToastAtTop = 0,
    ToastAtBotton,
    ToastAtCenter
};
@interface WDMToast : NSObject{
    CGFloat duration;         //显示时间
}
/**
 *  根据详细设置显示toast
 *
 *  @param toastSting Toast信息
 *  @param time       显示持续时间
 *  @param frame      Toast位置
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting duration:(CGFloat)time frame:(CGRect)frame inContronller:(UIViewController *)controller;

/**
 *  详细设置
 *
 *  @param toastSting Toast信息
 *  @param time       显示持续时间
 *  @param position   Toast位置
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting duration:(CGFloat)time position:(TOASTPOSITION)position inContronller:(UIViewController *)controller;
/**
 *  根据位置显示Toast
 *
 *  @param toastSting Toast信息
 *  @param position   Toast位置
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting position:(TOASTPOSITION)position inContronller:(UIViewController *)controller;

/**
 *  根据时间显示Toast
 *
 *  @param toastSting Toast信息
 *  @param time       显示持续时间
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting duration:(CGFloat)time inContronller:(UIViewController *)controller;
/**
 *  默认显示Toast
 *
 *  @param toastSting Toast信息
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting inContronller:(UIViewController *)controller;
@end
