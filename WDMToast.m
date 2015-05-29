//
//  WDMToast.m
//  table
//
//  Created by lei_dream on 15/5/28.
//  Copyright (c) 2015年 lei_dream. All rights reserved.
//

#import "WDMToast.h"
#import "UIView+Common.h"

#define IPHONESCREEN ([UIScreen mainScreen])
@implementation WDMToast

-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

/**
 *  显示toast
 *
 *  @param toastSting Toast信息
 *  @param time       显示持续时间
 *  @param frame      Toast位置
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting duration:(CGFloat)time frame:(CGRect)frame inContronller:(UIViewController *)controller{
    
    UIView *toastView = [[UIView alloc]initWithFrame:frame];
    toastView.tag = 123321;
    toastView.backgroundColor = [UIColor blackColor];
    toastView.alpha = 0.75f;
    toastView.layer.cornerRadius = 5.0f;
    toastView.layer.borderWidth = 0.2f;
    toastView.layer.borderColor = (__bridge CGColorRef)([UIColor darkGrayColor]);
    [toastView.layer setMasksToBounds:YES];
    
    [controller.view addSubview:toastView];
    
    UILabel *messege = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    messege.text = toastSting;
    messege.backgroundColor = [UIColor clearColor];
    messege.textColor = [UIColor whiteColor];
    messege.textAlignment = UITextAlignmentCenter;
    messege.numberOfLines = 0;
    
    [toastView addSubview:messege];
    
    if (time <0.000001) {
        time = Defaultduration;
    }
    [self performSelector:@selector(removeToastView:) withObject:controller afterDelay:time];
}


/**
 *  纤细设置
 *
 *  @param toastSting Toast信息
 *  @param time       显示持续时间
 *  @param position   Toast位置
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting duration:(CGFloat)time position:(TOASTPOSITION)position inContronller:(UIViewController *)controller{
    CGPoint origin;
    CGRect  frame;
    
    switch (position) {
        case ToastAtTop: {
            origin.x = (controller.view.width - DefauleWidth)/2;
            origin.y = 0;
            break;
        }
        case ToastAtBotton: {
            origin.x = (controller.view.width - DefauleWidth)/2;
            origin.y = controller.view.height-Defauleheight;
            break;
        }
        case ToastAtCenter: {
            origin.x = (controller.view.width - DefauleWidth)/2;
            origin.y = (controller.view.height - Defauleheight)/2;
            origin.y -= controller.navigationController.navigationBar?64:20; //判断是否有导航栏
            break;
        }
    }

    frame.size = DEFAULTSIZE;
    frame.origin = origin;
    
    [WDMToast showToast:toastSting duration:time frame:frame inContronller:controller];
}
/**
 *  根据位置显示Toast
 *
 *  @param toastSting Toast信息
 *  @param position   Toast位置
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting position:(TOASTPOSITION)position inContronller:(UIViewController *)controller{
    [WDMToast showToast:toastSting duration:Defaultduration position:position inContronller:controller];
}

/**
 *  根据时间显示Toast
 *
 *  @param toastSting Toast信息
 *  @param time       显示持续时间
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting duration:(CGFloat)time inContronller:(UIViewController *)controller{
    [WDMToast showToast:toastSting duration:time position:ToastAtCenter inContronller:controller];
}
/**
 *  默认显示Toast
 *
 *  @param toastSting Toast信息
 *  @param controller 所在controller
 */
+(void)showToast:(NSString*)toastSting inContronller:(UIViewController *)controller{
    [WDMToast showToast:toastSting duration:Defaultduration position:ToastAtCenter inContronller:controller];
}
/**
 *  Toast从视图中移除
 *
 *  @param controller Toast显示的视图控制器
 */
+(void)removeToastView:(UIViewController *)controller{
    UIView *toastView = [controller.view viewWithTag:123321];
    [toastView removeFromSuperview];
    toastView = nil;
}

@end
