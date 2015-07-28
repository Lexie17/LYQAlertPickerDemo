//
//  ViewController.m
//  LYQAlertPickerDemo
//
//  Created by liangyiqi on 15/7/28.
//  Copyright (c) 2015年 LYQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UINavigationControllerDelegate>
{
    UIAlertController       *_pickerContainerSheetCtrl;
    UIPickerView            *_picker;
    NSArray                 *_dataArray;
    IBOutlet    UILabel     *_choosedLabel;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initPicker];
    _dataArray = @[@"北京",@"上海",@"广州",@"深圳",@"杭州",@"南京",@"武汉",@"长沙",@"成都",@"重庆"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initPicker
{
    // 1.初始化UIAlertController，类型是actionSheet
    // "\n"用来给picker留出位置
    _pickerContainerSheetCtrl = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 2.初始化action
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        // 点击“确定”后的响应
        _choosedLabel.text = [_dataArray objectAtIndex:[_picker selectedRowInComponent:0]];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        // 点击“取消”后的响应
        _choosedLabel.text = @"Nothing was choosed";
    }];
    
    // 3.将action关联到UIAlertController
    [_pickerContainerSheetCtrl addAction:action];
    [_pickerContainerSheetCtrl addAction:cancelAction];
    
    // 4.初始化picker,由于UIAlertController的白色view并的宽度比屏幕窄一些，picker不能比它的superview宽
    _picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width -20, 140)];
    _picker.delegate =self;
    _picker.dataSource = self;
    _picker.backgroundColor = [UIColor clearColor];// 背景色设置为透明，add到UIAlertController上更和谐
    
    // 5.将picker放置到UIAlertController上
    [_pickerContainerSheetCtrl.view addSubview:_picker];

}

- (IBAction)showPicker:(id)sender
{
    [self presentViewController:_pickerContainerSheetCtrl animated:YES completion:^{
        
    }];
}

#pragma mark - UIPickerView delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_dataArray objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

@end
