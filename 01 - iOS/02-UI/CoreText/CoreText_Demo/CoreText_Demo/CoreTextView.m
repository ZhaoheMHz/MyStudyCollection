//
//  CoreTextView.m
//  CoreText_Demo
//
//  Created by baoxu on 16/3/12.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "CoreTextView.h"
#import <CoreText/CoreText.h>

@implementation CoreTextView


//CoreText的使用
-(void)characterAttribute{
    
    NSString *str = @"This is test of characterAttribute.中文字符";
     
    //富文本字符串（可以对字符串做详细的操作）
    NSMutableAttributedString * mabString = [[NSMutableAttributedString alloc]initWithString:str];
    //进入字符串的编辑状态
    [mabString beginEditing];
    //设置字体风格
    CTFontRef font = CTFontCreateWithName(CFSTR("Georgia"), 40, NULL);
    
//    for (NSString *name in [UIFont familyNames]) {
//        NSLog(@"%@",name);
//    }
    //将字体赋值给字符串
    [mabString addAttribute:(id)kCTFontAttributeName value:(__bridge id _Nonnull)(font) range:NSMakeRange(0, [str length])];
    /*
    //设置字体的间隔
    long number = 10;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [mabString addAttribute:(id)kCTKernAttributeName value:(__bridge id _Nonnull)(num) range:NSMakeRange(0, 20)];
    */
    /*
    //字体颜色(颜色可直接使用UIColor)
    [mabString addAttribute:(id)kCTForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, 20)];
    */
    /*
    //设置空心字
    long number = 3;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
    [mabString addAttribute:(id)kCTStrokeWidthAttributeName value:(__bridge id _Nonnull)(num) range:NSMakeRange(0, str.length)];
    //设置空心字颜色
    [mabString addAttribute:(id)kCTForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, 20)];
    */
    
    /*
    //设置斜体(大小起作用的是后面的50)
    CTFontRef font2 = CTFontCreateWithName((CFStringRef)[UIFont italicSystemFontOfSize:10].fontName, 50, NULL);
    [mabString addAttribute:(id)kCTFontAttributeName value:(__bridge id _Nonnull)(font2) range:NSMakeRange(20, str.length-20)];
    */
    /*
    //设置下划线
    [mabString addAttribute:(id)kCTUnderlineStyleAttributeName value:[NSNumber numberWithInt:kCTUnderlineStyleDouble] range:NSMakeRange(15, str.length-15)];
    //设置下划线的颜色
    [mabString addAttribute:(id)kCTUnderlineColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(20, str.length - 20)];
    */
    
    //可以对同一段字体进行多属性赋值
    //使用颜色创建一个字典
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:[UIColor redColor] forKey:(id)kCTForegroundColorAttributeName];
    //斜体
    CTFontRef font3 = CTFontCreateWithName((CFStringRef)[UIFont italicSystemFontOfSize:30].fontName, 40, NULL);
    
    [attributes setObject:(__bridge id _Nonnull)(font3) forKey:(id)kCTFontAttributeName];
    //下划线
    [attributes setObject:[NSNumber numberWithInt:kCTUnderlineStyleSingle] forKey:(id)kCTUnderlineStyleAttributeName];
    
    //赋值
    [mabString addAttributes:attributes range:NSMakeRange(0, 10)];
    
    
    //获取字符串的属性
    NSRange kRange = NSMakeRange(0, 10);
    NSDictionary *dict = [mabString attributesAtIndex:0 effectiveRange:&kRange];
    NSLog(@"dict:%@",dict);
    
    //结束编辑
    [mabString endEditing];
    
    
    
    /****下面的代码将字符串展示出来****/
    //1.创建CTFramesetterRef对象，为下面的参数服务
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mabString);
    //2.给一个路径对象（用来封装文本坐标位置等）
    CGMutablePathRef path = CGPathCreateMutable();
    
    //3.给个显示字符串的坐标范围
    CGPathAddRect(path, NULL, CGRectMake(10, 10, self.bounds.size.width - 20, self.bounds.size.height - 20));
    //4.建立字符串的画布
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    //5.获取当前view的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //6.用上面的创建的设置来设置文本矩阵
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    //7.保存现在的上下文状态，后续的操作不会影响到现在的屏幕
    CGContextSaveGState(context);
    
    //处理坐标系
    
//    //将被缩放到上面的文本下移回来
//    CGContextTranslateCTM(context, 1.0, self.bounds.size.height);
    
    //将y轴翻转，缩放到-1
    CGContextScaleCTM(context, 1.0, -1.0);

    //将被缩放到上面的文本下移回来,使用负数的y值，因为此时坐标系已经变成负的了
    CGContextTranslateCTM(context, 1.0, -self.bounds.size.height);
    
    
    //8.绘制到屏幕
    CTFrameDraw(frame, context);
    
    //释放
    CGPathRelease(path);
    CFRelease(frameSetter);
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self characterAttribute];
    
}


@end
