//
//  AddItemController.m
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "AddItemController.h"
#import "DatabaseManager.h"

@interface AddItemController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *infoTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *starSeg;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIButton *backToShowBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@end

@implementation AddItemController

{
    NSString *_nameUpdateBefore;
}

- (IBAction)backToShow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置返回键和保存键的样式 0,91,255
    [self.backToShowBtn.layer setCornerRadius:5];
    [self.backToShowBtn.layer setBorderColor:[UIColor colorWithRed:0 green:122/255.0 blue:255/255.0 alpha:1].CGColor];
    [self.backToShowBtn.layer setBorderWidth:1];
    [self.saveBtn.layer setCornerRadius:5];
    [self.saveBtn.layer setBorderColor:[UIColor colorWithRed:0 green:122/255.0 blue:255/255.0 alpha:1].CGColor];
    [self.saveBtn.layer setBorderWidth:1];
    
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveClick)];
    
    // 记录修改前的条目名称
    _nameUpdateBefore = self.model.name;
    
    self.nameTF.text = self.model.name;
    self.infoTF.text = self.model.info;
    if (self.model.star) {
        self.starSeg.selectedSegmentIndex = self.model.star.intValue-1;
    } else {
        self.starSeg.selectedSegmentIndex = 0;
    }
    
    if (!self.category) {
        self.category = self.model.category;
    }
    
    
    // 设置搜索结果点击时,点击保存的效果
    if (self.isSearch) {
        self.backToShowBtn.hidden = NO;
        self.searchBtn.hidden = NO;
    } else {
        self.backToShowBtn.hidden = YES;
        self.searchBtn.hidden = YES;
    }
    [self.searchBtn addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
}

// 保存按钮
- (void)saveClick
{
    // 如果有空的TextFiled,就不允许保存
    if ([self.nameTF.text isEqualToString:@""]) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"警告" message:@"不允许输入空内容" delegate:nil cancelButtonTitle:@"继续填写" otherButtonTitles:nil];
        [av show];
        return;
    }
    
    // 根据是否传值,判断保存的操作是insert还是update
    if (!_model) {
        _model = [[Model alloc] init];
    }
    
    _model.name = self.nameTF.text;
    _model.info = self.infoTF.text;
    _model.star = [NSString stringWithFormat:@"%zd", (self.starSeg.selectedSegmentIndex+1)];
    
    // 创建时间戳对象,转化NSString和NSDate
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    // 设置格式
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss.0";
    _model.commitDate = [df stringFromDate:[NSDate date]];
    
    _model.category = self.category;
    
    if (self.delegate) {
        if ([[DatabaseManager defaultManager] insertWithModel:_model]) {
            [self.delegate addItemWithModel:_model];
            
            [self.delegate setIsRefresh:YES];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            NSLog(@"insert成功");
        }
        else {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"保存失败" message:@"名称重复" delegate:nil cancelButtonTitle:@"重新填写" otherButtonTitles:nil];
            [av show];
        }
    } else {
        if ([[DatabaseManager defaultManager] updateWithModel:_model itemWithNameUpdateBefore:_nameUpdateBefore]) {
            
            NSLog(@"update成功");
            if (self.isSearch) {
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }
        else {
            NSLog(@"update失败");
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
