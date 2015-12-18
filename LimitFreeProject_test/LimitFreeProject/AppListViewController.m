//
//  AppListViewController.m
//  LimitFreeProject
//
//  Created by baoxu on 15/10/12.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "AppListViewController.h"
//接口
#import "NetInterface.h"
//网络
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
//model
#import "ZJModelTool.h"
#import "AppModel.h"
#import "AppCell.h"

//适配
#import "ZJScreenAdaptation.h"
#import "ZJScreenAdaptaionMacro.h"
#import "CategoryViewController.h"
#import "SearchViewController.h"
#import "ConfigViewController.h"

@interface AppListViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    //tableView
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    
    //url参数
    int _page;
    NSString *_categoryId;
    
    //搜索
    UISearchBar *_seachBar;
}
@end

@implementation AppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _page = 1;
    _categoryId = @"";
    _dataArray = [[NSMutableArray alloc]init];
    
    [self downloadData];
    [self createTableView];
    
    [self configNavigation];
    [self createSearchBar];
}
//先下载数据
-(void)downloadData{
    
    [_dataArray removeAllObjects];
    
    NSString *urlStr = [NSString stringWithFormat:self.urlString,_page,_categoryId];
    
    NSLog(@"urlString:%@",urlStr);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray * apps = dict[@"applications"];
        
        for (NSDictionary *appDict in apps) {
//            NSLog(@"name = %@",appDict[@"name"]);
//            [ZJModelTool createModelWithDictionary:appDict modelName:@"AppModel"];
            AppModel *model = [[AppModel alloc]init];
            //用字典为model赋值
            [model setValuesForKeysWithDictionary:appDict];
            model.desc = appDict[@"description"];
            [_dataArray addObject:model];
        }
        
        [_tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}

//配置导航
-(void)configNavigation{
    UIBarButtonItem *catagory = [self createItemWithSize:CGSizeMake(40, 28) image:@"buttonbar_action.png" title:@"分类" target:self action:@selector( dealCategory)];
    
    UIBarButtonItem *configItem = [self createItemWithSize:CGSizeMake(40, 28) image:@"buttonbar_action.png" title:@"配置" target:self action:@selector(dealConfig)];
    
    
    self.navigationItem.leftBarButtonItem = catagory;
    self.navigationItem.rightBarButtonItem = configItem;
}

-(void)createSearchBar{
    _seachBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    _seachBar.placeholder = @"60万款应用搜搜看";
    _seachBar.delegate = self;
    _tableView.tableHeaderView = _seachBar;
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"search:%@",_seachBar.text);
    
    SearchViewController *svc = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
    
    svc.searchKeyword = _seachBar.text;
    
    [self.navigationController pushViewController:svc animated:YES];
}


-(void)dealCategory{
    CategoryViewController *cvc = [[CategoryViewController alloc]initWithNibName:@"CategoryViewController" bundle:nil];
    [cvc setChangeCategory:^(NSString *categoryId) {
        
        _categoryId = categoryId;
        _page = 1;
        [self downloadData];
        
    }];
    
    [self.navigationController pushViewController:cvc animated:YES];
    
}

-(void)dealConfig{

    ConfigViewController *cvc = [[ConfigViewController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];
}

//定制barItem，传入必要的参数
-(UIBarButtonItem*)createItemWithSize:(CGSize)size image:(NSString*)image title:(NSString*)title target:(id)target action:(SEL)action{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMakeEx(0, 0, size.width, size.height);
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    return item;
}



//createTableView
-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[AppCell class] forCellReuseIdentifier:@"AppCell"];
}

//代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppCell"];
    
    AppModel *model = _dataArray[indexPath.row];
    
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%ld.%@",indexPath.row+1,model.name];
    
    [cell.starView setStar:model.starOverall.doubleValue];
    
    cell.categoryLabel.text = model.categoryName;
    
    cell.priceLabel.text = [NSString stringWithFormat:@"%.2f",model.lastPrice.doubleValue];
    
    cell.sharesLabel.text = [NSString stringWithFormat:@"分享:%@",model.shares];
    
    cell.favoriteLabel.text = [NSString stringWithFormat:@"收藏:%@",model.favorites];
    
    cell.downloadLabel.text = [NSString stringWithFormat:@"下载:%@",model.downloads];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return heightEx(100);
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
