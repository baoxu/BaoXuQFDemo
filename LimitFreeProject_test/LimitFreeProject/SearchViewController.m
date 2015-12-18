//
//  SearchViewController.m
//  LimitFreeProject
//
//  Created by baoxu on 15/10/13.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "SearchViewController.h"

#import "AppCell.h"
#import "AppModel.h"

@interface SearchViewController ()
{
    NSMutableArray *_dataArray;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"搜索结果";
    _dataArray = [[NSMutableArray alloc]init];
    
    [self downloadData];
    
    [self.tableView registerClass:[AppCell class] forCellReuseIdentifier:@"cell"];
}

-(void)downloadData{
    //生成下载链接
    
    //url网址需要把中文转码为 UTF8
    self.searchKeyword = [self.searchKeyword stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"sk :%@",self.searchKeyword);
    
    NSString *urlString = [NSString stringWithFormat:SEARCH_URL,self.searchKeyword];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *apps = dict[@"applications"];
        
        for (NSDictionary *appDic in apps) {
            AppModel *model = [[AppModel alloc]init];
            [model setValuesForKeysWithDictionary:appDic];
            model.desc = appDic[@"description"];
            
            NSLog(@"name:%@",model.name);
            
            [_dataArray addObject:model];
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return heightEx(100);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
