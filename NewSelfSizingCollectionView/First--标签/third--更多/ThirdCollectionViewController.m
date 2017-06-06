//
//  ThirdCollectionViewController.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/6/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ThirdCollectionViewController.h"
#import "ThirdCollectionViewCell.h"
#import "ThirdModel.h"

@interface ThirdCollectionViewController ()<ThirdCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *thirdFlow;
@property(nonatomic,strong)NSMutableArray * dataArr;

@end

@implementation ThirdCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"更多";
    
    self.dataArr = [NSMutableArray array];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ThirdCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ThirdCollectionViewCell"];
    self.thirdFlow.estimatedItemSize = CGSizeMake(20, 20);
    self.thirdFlow.minimumInteritemSpacing = 0;
    self.thirdFlow.minimumLineSpacing = 10;
 
    
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    //加载JSON文件
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    //将JSON数据转为NSArray或NSDictionary
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray * arr = dict[@"allData"];
    
    for (NSInteger i = 0; i <arr.count; i++) {
        
        NSDictionary * dic = arr[i];
        
        ThirdModel * model = [ThirdModel new];
        model.name = dic[@"name"];
        model.image = dic[@"image"];
        model.address = dic[@"address"];
        [self.dataArr  addObject:model];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ThirdCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThirdCollectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    ThirdModel * model = self.dataArr[indexPath.item];
    [cell configureData:model];
    
    return cell;
}

#pragma mark- ThirdCollectionViewCellDelegate

-(void)clickMore{

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"更多" message:@"哇哈哈哈" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
