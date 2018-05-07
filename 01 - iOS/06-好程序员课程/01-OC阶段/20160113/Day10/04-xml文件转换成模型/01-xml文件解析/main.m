//
//  main.m
//  01-xml文件解析
//
//  Created by 哲 肖 on 15/10/29.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
#import "XMLTool.h"
#import "Shop.h"
#import "Promotion.h"
/*
 
 xml: 标记性的语言,主要用于网络传输数据
 
 毕竟 ,上海
 
 
 <root>
    <citys>
        <city> 北京</city>
        <city> 上海</city>
    </citys>
 
 </root>
 
 */

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        
        //xml 解析
        //xml -> 字典
        //josn- > 字典
        //字典 - > 数据模型
        
        NSString * path = @"/Users/xiaozhe/Desktop/test2.xml";
        NSData * xmlData= [NSData dataWithContentsOfFile:path];
        
        NSDictionary * dict = [XMLTool xmlToolWithXMLData:xmlData];

        Shop * shop = [Shop shopWithDict:dict];
        
        Promotion * prom = shop.list[0];
        NSLog(@"%@",prom.name);
        
//        NSLog(@"%@",dict);
       
    }
    return 0;
}
