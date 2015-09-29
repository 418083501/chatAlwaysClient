//
//  LRMeCtrl.m
//  AlwaysChat
//
//  Created by lurong on 15/9/28.
//  Copyright © 2015年 lurong. All rights reserved.
//

#import "LRMeCtrl.h"

#define TITLE_KEY @"TITLE_KEY"
#define IMAGE_KEY @"IMAGE_KEY"

@interface LRMeCtrl ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataArray;
    BOOL _isFirst;
    UITableView *_tableView;
}

@end

@implementation LRMeCtrl


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hehe"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hehe"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSDictionary *dict = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = dict[TITLE_KEY];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if (section == 0) {
//        return .5;
//    }
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selected = NO;
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
    
    _dataArray = @[
                   @[
                       @{TITLE_KEY:@"相册",IMAGE_KEY:@""}
                       
                       ],
                   @[@{TITLE_KEY:@"好评鼓励",IMAGE_KEY:@""},
                     @{TITLE_KEY:@"意见反馈",IMAGE_KEY:@""},
                     @{TITLE_KEY:@"分享给朋友",IMAGE_KEY:@""}
                     ]
                   ,
                   @[
                       @{TITLE_KEY:@"设置",IMAGE_KEY:@""}
                       ]
                   ];
    [self makeHeader];
    
}

-(void)makeHeader
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 90)];
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.width, 15)];
    header.backgroundColor = [UIColor clearColor];
    [view addSubview:header];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, header.height, view.width, view.height - header.height)];
    [view addSubview:contentView];
    contentView.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (contentView.height - 45)/2, 45, 45)];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 3;
    imageView.layer.borderWidth = .5;
    imageView.layer.borderColor = [UIColor blackColor].CGColor;
    [contentView addSubview:imageView];
    
    [imageView setImageWithURL:[NSURL URLWithString:LOGIN_USER.facePath] placeholderImage:FACE_LOAD];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.width + imageView.x + 10, imageView.y, 200, 16)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:15];
    label.text = LOGIN_USER.name;
    [contentView addSubview:label];
    
    _tableView.tableHeaderView = view;
    
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
