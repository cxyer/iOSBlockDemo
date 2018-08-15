//
//  ViewController.m
//  iOSBlockDemo
//
//  Created by 蔡晓阳 on 2018/7/17.
//  Copyright © 2018 cxy. All rights reserved.
//

#import "ViewController.h"

int number = 666;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArr;



@end

@implementation ViewController

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"捕获局部变量",@"修改局部变量",@"blcok定义时便有了值",@"捕获全局变量",@"修改全局变量"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (indexPath.row == 0) {
        [self test1];
    } else if (indexPath.row == 1) {
        [self test2];
    } else if (indexPath.row == 2) {
        [self test3];
    } else if (indexPath.row == 3) {
        [self test4];
    } else if (indexPath.row == 4) {
        [self test5];
    }
}

- (void)test1 {
    int num = 666;
    void (^test)(void) = ^(void){
        NSLog(@"%d",num);
    };
    test();
}
- (void)test2 {
    __block int num = 666;
    void (^test)(void) = ^(void){
        num = 555;
        NSLog(@"%d",num);
    };
    test();
}

- (void)test3 {
    int num = 666;
    void (^test)(void) = ^(void){
        NSLog(@"%d",num);
    };
    num = 555;
    test();
}

- (void)test4 {
    void (^test)(void) = ^(void){
        NSLog(@"%d",number);
    };
    test();
}
- (void)test5 {
    void (^test)(void) = ^(void){
        number = 555;
        NSLog(@"%d",number);
    };
    test();
}




@end
