//
//  XMLTool.m
//  01-xml文件解析
//
//  Created by 哲 肖 on 15/10/29.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "XMLTool.h"
#import "GDataXMLNode.h"

@implementation XMLTool

+(NSDictionary *)xmlToolWithXMLData:(NSData *)xmlData
{
    GDataXMLDocument * document = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:nil];
    
    GDataXMLElement * rootElement = document.rootElement;
    
    
    return [self dictWithElement:rootElement];
    /*
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    for(GDataXMLElement * tmp in rootElement.children)
    {
        NSString * key = tmp.name;
        NSString * value = tmp.stringValue;
        
        [dict setObject:value forKey:key];
    }
     
    return dict;
     */
}

+ (NSDictionary *)dictWithElement:(GDataXMLElement *)rootElement
{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    for(GDataXMLElement * tmp in rootElement.children)
    {
        id value = tmp.stringValue;
        
        
        if(tmp.children.count > 1)
        {
            NSMutableArray * array = [NSMutableArray array];
            
            for(GDataXMLElement * childrenElement in tmp.children)
            {
                NSDictionary * dict = [self dictWithElement:childrenElement];
                [array addObject:dict];
            }
            
            value = array;
        }
        
        NSString * key = tmp.name;
     
        [dict setObject:value forKey:key];
    }
    
    return dict;
}

@end
