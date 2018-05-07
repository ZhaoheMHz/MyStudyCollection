//
//  GPCityView.m
//  02-级联操作
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPCityView.h"

@interface GPCityView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, weak)UITableView * cityTableView;

@end

@implementation GPCityView

+ (id)cityViewWithFrame:(CGRect)rect
{
    GPCityView * cityView = [[GPCityView alloc] initWithFrame:rect style:UITableViewStylePlain];
    //自己作为自己的数据源,与代理的实现者
    cityView.dataSource = cityView;//self;//GPCityView
    cityView.delegate = cityView;//self;
    
    return cityView;
}

/*
+(id)cityViewWithFrame:(CGRect)rect
{
    return [[self alloc] initWithFrame:rect];
}

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UITableView * cityTableView = [[UITableView alloc] init];
        [self addSubview:cityTableView];
        cityTableView.dataSource = self;
        cityTableView.delegate = self;
        cityTableView.frame = self.bounds;
        self.cityTableView = cityTableView;
    }
    return self;
}
*/
- (void)setCityArray:(NSArray *)cityArray
{
    _cityArray = cityArray;
    //更新数据源
    [self.cityTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.cityArray.count;
  
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      //如果取出字典的key值
    NSDictionary * dict = self.cityArray[indexPath.row];
    NSArray * allKeys = [dict allKeys];
    NSString * cityName = [allKeys lastObject];
    
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = cityName;
    
    return cell;
    
}//end method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dict = self.cityArray[indexPath.row];
    NSArray * allValues = [dict allValues];
    NSArray * areaArray  = [allValues lastObject];
    
    [self.mydelegate cityViewDidSelectedRow:self
                                indexPath:indexPath objects:areaArray];
}



@end
