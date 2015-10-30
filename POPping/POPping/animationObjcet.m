//
//  animationObjcet.m
//  POPping
//
//  Created by chuck on 15-6-9.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "animationObjcet.h"
#import "ViewController.h"
#import "secondViewController.h"

@implementation animationObjcet


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.context = transitionContext;
    
    UIView * container = [transitionContext containerView];
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIButton * btn;
    if ([fromVC isKindOfClass:[ViewController class]]) { //push
        NSLog(@"push");
        btn = ((ViewController *)fromVC).btn;
    }else if ([fromVC isKindOfClass:[secondViewController class]]){//pop
        NSLog(@"pop");
        btn = ((secondViewController *)fromVC).btn;
    }
    
    [container addSubview:toVC.view];
    
    UIBezierPath * initPath = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
    CGFloat newR = sqrt(btn.center.x*btn.center.x + (btn.center.y-CGRectGetHeight(toVC.view.bounds))*(btn.center.y-CGRectGetHeight(toVC.view.bounds)));
    
    UIBezierPath * finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(btn.frame, -newR, -newR)];
    
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = [finalPath CGPath];
    toVC.view.layer.mask = maskLayer;
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id)([initPath CGPath]);
    animation.toValue = (__bridge id)([finalPath CGPath]);
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;
    
    //添加动画
    [maskLayer addAnimation:animation forKey:@"path"];
    
    /*
    // 可以看做为destination ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 可以看做为source ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 添加toView到容器上
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0.0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        // 动画效果有很多,这里就展示个左偏移
        fromViewController.view.transform = CGAffineTransformMakeTranslation(-320, 0);
        toViewController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束-->记住，一定别忘了在过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    */
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.context viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    [self.context viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.context completeTransition:![self.context transitionWasCancelled]];
}




@end
