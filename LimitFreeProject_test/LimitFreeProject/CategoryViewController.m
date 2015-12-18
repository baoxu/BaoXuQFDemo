//
//  CategoryViewController.m
//  LimitFreeProject
//
//  Created by baoxu on 15/10/13.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "CategoryViewController.h"

#import "CategoryCell.h"
#import "CategoryModel.h"

@interface CategoryViewController ()
{
    NSMutableArray *_dataArray;
}
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self downloadData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CategoryCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

-(void)downloadData{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:CATE_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *cateDic in array) {
            
//            [ZJModelTool createModelWithDictionary:cateDic modelName:@"CategoryModel"];
            CategoryModel *model = [[CategoryModel alloc]init];
            [model setValuesForKeysWithDictionary:cateDic];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    CategoryModel *model = _dataArray[indexPath.row];
    
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:model.picUrl]];
    cell.iconImageView.clipsToBounds = YES;
    cell.iconImageView.layer.cornerRadius = 10;
    
    cell.titleLable.text = model.categoryName;
    ;
    
    cell.deatailLabel.text = [NSString stringWithFormat:@"共有%d款应用,其中限免%d款",model.categoryCount.intValue,model.limited.intValue];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    CategoryModel *model = _dataArray[indexPath.row];
    if (self.changeCategory) {
        self.changeCategory(model.categoryId);
    }
    [self.navigationController popViewControllerAnimated:YES];
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
