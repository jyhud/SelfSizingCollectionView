//
//  SecondCollectionViewController.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/5/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "SecondCollectionViewController.h"
#import "SecondCollectionViewCell.h"


@interface SecondCollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *secondFlow;
@property(nonatomic,strong)NSMutableArray * dataArr;

@end

@implementation SecondCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"列表";

    self.dataArr  =[NSMutableArray array];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"SecondCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SecondCollectionViewCell"];
    
    self.secondFlow.estimatedItemSize = CGSizeMake(20, 20);
    self.secondFlow.minimumInteritemSpacing = 20;
    self.secondFlow.minimumLineSpacing = 20;
    
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    //加载JSON文件
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    //将JSON数据转为NSArray或NSDictionary
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray * arr = dict[@"allData"];
    
    for (NSInteger i = 0; i <arr.count; i++) {
       
        NSDictionary * dic = arr[i];
        
        SecondModel * model = [SecondModel new];
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
    
    SecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondCollectionViewCell" forIndexPath:indexPath];
    SecondModel * model = self.dataArr[indexPath.item];
    [cell configureData:model];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
