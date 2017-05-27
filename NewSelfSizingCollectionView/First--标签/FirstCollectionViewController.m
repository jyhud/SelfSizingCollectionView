//
//  FirstCollectionViewController.m
//  NewSelfSizingCollectionView
//
//  Created by 贾卓峰 on 2017/5/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FirstCollectionViewController.h"
#import "FirstCollectionViewCell.h"

@interface FirstCollectionViewController ()

@property(nonatomic,strong)NSArray * feedsArr;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *firstFlow;

@end

@implementation FirstCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"标签";
    [self.collectionView registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    self.firstFlow.estimatedItemSize= CGSizeMake(20, 20);
    self.firstFlow.minimumLineSpacing = 10;
    self.firstFlow.minimumInteritemSpacing = 10;
    
    self.feedsArr = @[@"用爱国书写心中大我",@"心有大我，至诚报国",@"看到习近平总书记对黄大年同志先进事迹作出的重要指示",@"不少熟悉了解黄大年的人都流下了激动的泪水：“爱国情怀，这就是黄大年的精神支柱，这就是黄大年的幸福源泉！",@"作为黄大年的秘书",@"黄大年的先进事迹宛若一部有血有肉的教科书，每一页都写满了爱国之情，",@"每一篇都抒发了强国之志，每一章都印证了报国之行。",@"振兴中华，乃吾辈之责"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return  self.feedsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FirstCollectionViewCell" forIndexPath:indexPath];
    cell.tagLabel.text = self.feedsArr[indexPath.item];
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
