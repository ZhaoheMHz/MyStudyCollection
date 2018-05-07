//
//  DetailViewController.m
//  A1fmdb
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "DetailViewController.h"
#import "DatabaseManager.h"

@interface DetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
    UIImagePickerController *_ipc;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"详情";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveClick)];
    
    // 展示详情点击传过来的数据
    if (_ps) {
        _nameTF.text = _ps.nameStr;
        _ageTF.text = _ps.ageStr;
        [_iconBtn setBackgroundImage:[UIImage imageWithData:_ps.iconData] forState:UIControlStateNormal];
    }
}

- (void)saveClick
{
    if (!_ps) {
        _ps = [[Person alloc] init];
    }
    _ps.nameStr = _nameTF.text;
    _ps.ageStr = _ageTF.text;
    _ps.iconData = UIImagePNGRepresentation([_iconBtn currentBackgroundImage]);
    
    DatabaseManager *manager = [DatabaseManager defaultManager];
    
    // 如果self.delegate为空,说明是修改,如果不为空,说明是插入数据
    if (self.delegate) {
        [self.delegate detailInserWithModel:_ps];
        
        // 在数据库中插入一条新数据
        [manager insertWithModel:_ps];
    }
    else {
        // 修改数据
        [manager updateWithModel:_ps forId:self.row+1];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)iconClick:(UIButton *)sender {
    if (_ipc == nil) {
        _ipc = [[UIImagePickerController alloc] init];
        _ipc.delegate = self;
        
        // 允许对相册中的图片进行编辑,info中增加键值UIImagePickerControllerEditedImage和UIImagePickerControllerCropRect
        _ipc.allowsEditing = YES;
    }
    
    [self.navigationController presentViewController:_ipc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.iconBtn setBackgroundImage:[info objectForKey:UIImagePickerControllerEditedImage] forState:UIControlStateNormal];
    
    [_ipc dismissViewControllerAnimated:YES completion:nil];
}

@end
