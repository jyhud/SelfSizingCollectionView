//
//  HomeViewController.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/5/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "HomeViewController.h"
#import "FirstCollectionViewController.h"
#import "SecondCollectionViewController.h"

@interface HomeViewController ()

@property(nonatomic,strong)NSArray * dataArr;//数据数组
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataArr = @[@"UIcollectionView --- 标签",@"UIcollectionView --- 列表"];
}

#pragma mark-UITableViewDataSource/UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * identify = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]init];
        
        cell.textLabel.text = self.dataArr[indexPath.row];
    }    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            FirstCollectionViewController * firstVC = [[FirstCollectionViewController alloc]initWithNibName:@"FirstCollectionViewController" bundle:nil];
            [self.navigationController pushViewController:firstVC animated:YES];
            
        }
            break;
        case 1:
        {
            SecondCollectionViewController * secondVC = [[SecondCollectionViewController alloc]initWithNibName:@"SecondCollectionViewController" bundle:nil];
            [self.navigationController pushViewController:secondVC animated:YES];

        }
            break;
            
        default:
            break;
    }
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
