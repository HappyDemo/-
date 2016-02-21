//
//  ViewController.m
//  无限滚动
//
//  Created by Caoxia on 16/2/21.
//  Copyright © 2016年 company. All rights reserved.
//

#import "ViewController.h"
#import "CXCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController

//static NSInteger
static NSInteger const maxItem = 4 * 500;
static NSString *const CXCollectionViewCellID = @"CXCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    //设置itemSize
    //这里设置的是显示的每个collectionView里面item的尺寸大小
    flowlayout.itemSize = CGSizeMake(375, 200);
    
    //设置每一行之间的间距
    flowlayout.minimumLineSpacing = 0;
    
    //设置水平滚动
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 375, 200) collectionViewLayout:flowlayout];
    
    //设置collectionView的数据源
    collectionView.dataSource = self;
    
    //设置可以分页效果
    collectionView.pagingEnabled = YES;
    
    //取消水平方向和竖直方向的滚动条
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    
    
    //取消边缘弹簧效果
    collectionView.bounces = NO;
    
    //将collectionView添加到控制器的View上去
    [self.view addSubview:collectionView];
    
    //加载Xib里面的View
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CXCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:CXCollectionViewCellID];
    
    //默认显示中间的cell
    [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:maxItem/2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return maxItem;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CXCollectionViewCellID forIndexPath:indexPath];
    
    CXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CXCollectionViewCellID forIndexPath:indexPath];

    
    NSString *name = [NSString stringWithFormat:@"image%zd",indexPath.item % 4];
    
    cell.imageView.image = [UIImage imageNamed:name];
    return cell;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //这种不需要注册,直接找Xib中绑定ID的,所以Xib中必须绑定ID
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#(nonnull NSString *)#>];
//    
//    
//    //这种情况会前面必须注册,这个时候,Xib是否绑定了ID都没有关系
//    //特点,这里后面会有forIndexPath
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#(nonnull NSString *)#> forIndexPath:<#(nonnull NSIndexPath *)#>];
//    
//}



@end
