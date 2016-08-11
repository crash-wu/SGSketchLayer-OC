//
//  TableViewController.m
//  SGSketchLayer-OC
//
//  Created by 吴小星 on 16/8/10.
//  Copyright © 2016年 吴小星. All rights reserved.
//

#import "TableViewController.h"


@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray<NSString*> *dateSource;

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELLID"];
    [self.view addSubview:self.tableView];
    
    self.dateSource = [NSArray arrayWithObjects:@"点",@"折线",@"曲线",@"曲面",@"多边形", nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dateSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dateSource[indexPath.row];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MapViewController *vc = [[MapViewController alloc  ]initWithSketchType:indexPath.row];
    [self.navigationController pushViewController:vc animated:true];
}


@end
