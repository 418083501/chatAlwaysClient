//
//  LRMainCtrl.m
//  AlwaysChat
//
//  Created by lurong on 15/9/28.
//  Copyright © 2015年 lurong. All rights reserved.
//

#import "LRMainCtrl.h"
#import "LRBaseUser.h"

@interface LRMainCtrl ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    BOOL _isFirst;
    NSMutableArray *_dataArray;
}

@end

@implementation LRMainCtrl

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hehe"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hehe"];
    }
    
    LRBaseUser *user = _dataArray[indexPath.row];
    [cell.imageView setImageWithURL:[NSURL URLWithString:user.facePath] placeholderImage:FACE_LOAD];
    cell.textLabel.text = user.name;
    
    cell.detailTextLabel.text = user.destrib;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_isFirst) {
        [self buildLayout];
        _isFirst = NO;
    }
}

-(void)buildLayout
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFirst = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
