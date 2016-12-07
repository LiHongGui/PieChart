//
//  PieChart.m
//  PieChart
//
//  Created by lihonggui on 2016/12/7.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "PieChart.h"

@implementation PieChart


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //设置数据
    NSArray *dataArray = @[@10,@20,@15,@5,@30,@10,@10];
    CGPoint center = self.center;
    CGFloat radius = self.frame.size.width/2;
    //设置起始点.终点
    CGFloat start = 0;
    CGFloat end = 0;
    for (int i = 0; i < dataArray.count; i++) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        end = [dataArray[i]floatValue] / 100 *2*M_PI +start;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
        CGContextAddPath(context, path.CGPath);
        [path addLineToPoint:center];
        [[self color]setFill];
        [path fill];
        
        //到此,返回继续循环
        //起点就是上一个的终点
        start = end;
    }
}

-(UIColor *)color
{
    CGFloat red = arc4random_uniform(256)/255.0;
    CGFloat green = arc4random_uniform(256)/255.0;
    CGFloat blue = arc4random_uniform(256)/255.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    return randomColor;
}
#pragma mark
#pragma mark -  点击屏幕,随机变换颜色
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //重新画图
    [self setNeedsDisplay];
}
@end
