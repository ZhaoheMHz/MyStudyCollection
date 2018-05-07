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

#define  XMLDATA 
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
        
        
        NSString * xmlString = @"<root><news><content>  第18届上海电影节闭幕  </content><time>2015年10月24日</time></news> <news><content>  江一燕霍思燕何止撞脸更撞穿衣风格  </content><time>    2015年10月25日</time></news><news><content>  朋友圈发个红包,结果6800元没了,微信这些开关一定要关掉  </content><time>    2015年10月26日</time></news><news><content>  E3大展上打了几把虚拟现实游戏,却发现最重要的是故事  </content><time>    2015年10月29日</time></news><news><content>  踏勘谋杀屈原现场:政客们的卑鄙谋杀案,是这样发生的  </content><time>    2015年10月28日</time></news><news><content>  印度总理莫迪数万人做瑜伽创记录  </content><time>    2015年10月27日</time></news></root>";

        NSData * data = [xmlString dataUsingEncoding:NSUTF8StringEncoding];
        
        GDataXMLDocument * documtn = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
        
        GDataXMLElement * element = documtn.rootElement;
        
        NSArray * nodes = [documtn nodesForXPath:@"/root/news" error:nil];
        
        for(GDataXMLElement * element in nodes)
        {
//            NSLog(@"%@ name ",element.name);
            
            for(GDataXMLElement * tmp in element.children)
            {
                  NSLog(@"value %@",tmp.stringValue);
                NSLog(@"name %@ " ,tmp.name);
              
            }
        }
        
//        NSLog(@"%@",nodes);
        
       
    }
    return 0;
}

/*
 GDataXMLDocument * document = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:nil];
 
 GDataXMLElement * rootElement = document.rootElement;
 
 NSMutableDictionary * dict = [NSMutableDictionary dictionary];
 for(GDataXMLElement * tmp in rootElement.children)
 {
 NSString * key = tmp.name;
 NSString * value = tmp.stringValue;
 
 [dict setObject:value forKey:key];
 }
 
 NSLog(@"%@",dict);
 
 NSString * str = dict[@"buyprefix"];
 NSLog(@"str %@",str);
 */

//使用迭代的方式去获得节点
void test()
{
    NSString * path = @"/Users/xiaozhe/Desktop/test.xml";
    NSData * xmlData= [NSData dataWithContentsOfFile:path];
    
    /*
     NSLog(@"%ld",xmlData.length);
     
     NSString * xmlString = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
     
     NSLog(@"%@",xmlString);
     */
    //1.加载xml文档
    NSError * error;
    GDataXMLDocument * document = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if(error) {
        NSLog(@"%@",error);
    }
    
    //2.获得根节点
    GDataXMLElement * rootElement = document.rootElement;
    /*
     NSLog(@"rootElement name %@",rootElement.name);
     NSLog(@"rootElement Value %@",rootElement.stringValue);
     */
    
    NSArray *  childrenArray = rootElement.children;
    //        NSLog(@"%@",childrenArray);
    
    for( GDataXMLElement * element in childrenArray)
    {
        //            NSLog(@"%@",NSStringFromClass([obj class]));
        
        /*
         NSLog(@"name %@",element.name);
         NSLog(@"value %@",element.stringValue);
         */
    }
    
    /*
     NSArray * tmpArray  = [rootElement elementsForName:@"shareprefix"];
     
     NSLog(@"%ld",tmpArray.count);
     GDataXMLElement * shareprefixElement  = tmpArray[0];
     NSLog(@"name %@",shareprefixElement.name);
     NSLog(@"value %@",shareprefixElement.stringValue);
     */
    
    
    
    NSArray * listArray = [rootElement elementsForName:@"list"];
    NSLog(@"listArray %ld",listArray.count);
    GDataXMLElement * listElement = listArray[0]
    ;
    NSArray * tmp = [listElement elementsForName:@"promotion"];
    //        NSLog(@"tmp %@",tmp);
    
    for(GDataXMLElement * promotionElement in tmp)
    {
        NSLog(@"name %@",promotionElement.name);
        NSLog(@"value %@",promotionElement.stringValue);
    }
    
    /*
     for(GDataXMLElement * tmp in listArray)
     {
     NSLog(@"name %@",tmp.name);
     NSLog(@"value %@",tmp.stringValue);
     }
     */
    /*
     NSArray * array = [rootElement elementsForName:@"promotion"];
     NSLog(@"%@",array);
     */
}

void test2()
{
    //Xpath
    
    NSString * path = @"/Users/xiaozhe/Desktop/test.xml";
    NSData * xmlData= [NSData dataWithContentsOfFile:path];
    
    NSError * error;
    GDataXMLDocument * document = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if(error) {
        NSLog(@"%@",error);
    }
    
    
    //1.获得根节点
    GDataXMLElement * rootElement = document.rootElement;
    
    NSArray * array = [rootElement nodesForXPath:@"/response/list" error:&error];
    //        NSLog(@"%@",array);
    
    array = [rootElement nodesForXPath:@"//list/promotion" error:&error];
    //        NSLog(@"%@",array);
    
    for(GDataXMLElement * element in array)
    {
        NSLog(@"name %@",element.name);
        NSLog(@"value %@",element.stringValue);
    }

}

void test3()
{
    //创建一个根节点
    GDataXMLElement * root = [GDataXMLElement elementWithName:@"root"];
    
    //创建子节点
    GDataXMLElement * citys = [GDataXMLElement elementWithName:@"citys"];
    
    
    GDataXMLElement * cityBeijing = [GDataXMLElement elementWithName:@"city"];
    cityBeijing.stringValue = @"北京";
    
    [citys addChild:cityBeijing];
    
    GDataXMLElement * cityShanghai = [GDataXMLElement elementWithName:@"city"];
    cityShanghai.stringValue = @"上海";
    
    [citys addChild:cityShanghai];
    
    
    //子节点关系建立完成自后,再去添加根节点
    [root addChild:citys];
    
    GDataXMLDocument * doucment = [[GDataXMLDocument alloc] initWithRootElement:root];
    [doucment setVersion:@"1.0"];
    [doucment setCharacterEncoding:@"utf-8"];
    
    NSData * xmlData = [doucment XMLData];
    NSString *path = @"/Users/xiaozhe/Desktop/city.xml";
    [xmlData writeToFile:path atomically:YES];

}