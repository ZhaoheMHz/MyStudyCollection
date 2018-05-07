//
//  main.m
//  Day10-XML解析
//
//  Created by ZhangChao on 16/1/13.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

#define kXmlPath @"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day10/JSON&XML/test2.xml"

void xmlTest()
{
    // 系统提供的XML解析库：NSXMLDocument
    // 常用三方库:GData
    
    // 转换XML数据的
    // 把XML字符串写入Document对象
    NSString *xmlString =
    @"<root><news><content>  第18届上海电影节闭幕  </content><time>2015年10月24日</time></news> <news><content>  江一燕霍思燕何止撞脸更撞穿衣风格  </content><time>    2015年10月25日</time></news><news><content>  朋友圈发个红包,结果6800元没了,微信这些开关一定要关掉  </content><time>    2015年10月26日</time></news><news><content>  E3大展上打了几把虚拟现实游戏,却发现最重要的是故事  </content><time>    2015年10月29日</time></news><news><content>  踏勘谋杀屈原现场:政客们的卑鄙谋杀案,是这样发生的  </content><time>    2015年10月28日</time></news><news><content>  印度总理莫迪数万人做瑜伽创记录  </content><time>    2015年10月27日</time></news></root>";
    
    GDataXMLDocument *doc =
    [[GDataXMLDocument alloc]
     initWithXMLString:xmlString options:0 error:nil];
    
    // 1.获取根节点 <root>...</root>
    GDataXMLElement *root =
    [doc rootElement];
    
    // 获取节点名称
    NSLog(@"root: %@", root.name);
    
    // 2.查看子节点 (所有)
    NSArray *children = [root children];
    NSLog(@"%@", children);
    
    // 获取第一个news节点
    GDataXMLElement *firstElement =
    children[0];
    
    NSArray *newsChildren = [firstElement children];
    
    // 获取content节点
    GDataXMLElement *content =
    newsChildren[0];
    
    // 获取time节点
    GDataXMLElement *time =
    newsChildren[1];
    
    // 获取节点内容
    NSLog(@"content: %@",
          content.stringValue);
    NSLog(@"time: %@",
          time.stringValue);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
//        NSURL *url = [NSURL URLWithString:@""];
//        NSData *xmlData =
//        [NSData dataWithContentsOfURL:url];
        NSData *xmlData =
        [NSData dataWithContentsOfFile:kXmlPath];
        
        // 从文件中读取解析XML数据
        GDataXMLDocument *doc =
        [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:nil];
        
        // 通过XPath 获取节点
        // "/" 表示从当前路径(root)开始搜索
        // "/"  从根节点开始遍历，不能跳级搜索
        // "//" 可以直接获得目标节点
        // "//" 会获取根节点下所有同名的目标节点
        GDataXMLElement *root = [doc rootElement];
        NSArray *list =
        [root nodesForXPath:@"/response/list" error:nil];
        
        // 同级list标签只有一个
        NSLog(@"%lu", list.count);
        
        // 如果存在多个节点，会全部获取
        NSArray *promotion =
        [root nodesForXPath:@"/response/list/promotion" error:nil];
//        NSLog(@"%@", promotion);
        
        GDataXMLElement *listEle =
        list.firstObject;
        
        //promotion
        //list/promotion
        NSArray *result =
        [listEle nodesForXPath:@"//promotion" error:nil];
        NSLog(@"%@", result);
    }
    
    return 0;
}




