//
//  RootViewController.m
//  Demo
//
//  Created by 许宗城 on 16/3/14.
//  Copyright © 2016年 许宗城. All rights reserved.
//

#import "RootViewController.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "TableViewCell.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;


@property (nonatomic, strong) UIImage *image;



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = @[@"http://s1.dwstatic.com/group1/M00/B8/B0/f0a2182fe60cbe993b8637f8bc07b1b6.jpg",@"http://s1.dwstatic.com/group1/M00/82/1A/1d466dde9fe444310f440e9fd9bac34f.gif",@"http://s1.dwstatic.com/group1/M00/82/1A/1d466dde9fe444310f440e9fd9bac34f.gif",@"http://tu.duowan.com/images/popularize-banner.png",@"http://tu.duowan.com/images/logo_v1.7.png",@"http://s1.dwstatic.com/group1/M00/85/27/28e1e190b34c6b6df082df53435da0f1.jpg",@"http://s1.dwstatic.com/group1/M00/82/1A/1d466dde9fe444310f440e9fd9bac34f.gif",@"http://s1.dwstatic.com/group1/M00/3A/B2/3ab2daae32a38946af15b1aeba252d8b6238.jpg",@"http://s1.dwstatic.com/group1/M00/66/CD/66cddacfd41dd0f11cfc9f40881859c87864.jpg",@"http://s1.dwstatic.com/group1/M00/34/AF/ed1ec98151f0748b358af6cd4ef4ed78.jpg",@"http://s1.dwstatic.com/group1/M00/7F/50/7f509f41d457f57f1807f90f2c78ec3d6009.jpg",@"http://s1.dwstatic.com/group1/M00/EF/35/ef35f731411b34f263bc71488d83d07b1559.jpg",@"http://s1.dwstatic.com/group1/M00/91/74/91747df40c5b29c8fa164c9a8950ee1b6641.jpg",@"http://s1.dwstatic.com/group1/M00/5E/84/5e84c28f59e9692b01dd6f7d7592c6f47003.jpg",@"http://s1.dwstatic.com/group1/M00/28/E6/28e68ef2a48ce30bd71eeb2d15eb20028458.jpg",@"http://s1.dwstatic.com/group1/M00/E6/F9/e6f9b764994d0c01cf0da7391b7d7d812650.jpg",@"http://s1.dwstatic.com/group1/M00/E6/8A/d9d5e337fdc8ff82adc34c75f9cf815d.jpg",@"http://s1.dwstatic.com/group1/M00/81/69/8169e3254b7a1273e8c7b58a120948bd3574.jpg",@"http://s1.dwstatic.com/group1/M00/A1/B1/a1b1f4cc3a7ab4f72ae0c6a0607b01d99841.jpg",@"http://s1.dwstatic.com/group1/M00/85/3D/853dd027a6d66428235b0d2cfa93a4118767.jpg",@"http://s1.dwstatic.com/group1/M00/E7/D5/e7d5d6fba0bbc1994d29838356654613609.jpg",@"http://s1.dwstatic.com/group1/M00/CF/59/cf59456088fd9bf94c1bbc6650eb11276495.jpg",@"http://s1.dwstatic.com/group1/M00/71/4B/714b53ce8e24796468f0aa7fa39b95ea6462.jpg",@"http://s1.dwstatic.com/group1/M00/9A/34/9a341e8458bbd6c271c2bdf286d4e84c3018.jpg",@"http://s1.dwstatic.com/group1/M00/61/89/6189e47484d5ba2df1040634af91fed12967.jpg",@"http://s1.dwstatic.com/group1/M00/15/25/1525c65ed85aa7e0fc8d77965d7938cf9143.jpg",@"http://s1.dwstatic.com/group1/M00/AF/F2/aff2359b1ad8e055630c14259048c98b6802.jpg",@"http://s1.dwstatic.com/group1/M00/36/9C/369c2945295c84192a877d8ad6fd33fa6494.jpg"];
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
    
    
    
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [self.view addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(70, 70));
//        make.center.equalTo(self.view);
//    }];
//    
//    
//    UIImage *oriImage = [UIImage imageNamed:@"image"];
//    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(70, 70), NO, [UIScreen mainScreen].scale);
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 70, 70) cornerRadius:10];
//    [path addClip];
//    [oriImage drawInRect:CGRectMake(0, 0, 70, 70)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    imageView.image = newImage;
//    
//    UIGraphicsEndImageContext();
    
}

- (void)rightAction {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CELLID";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell.image0 sd_setImageWithURL:[NSURL URLWithString:self.dataSource[indexPath.row]]];
    [cell.image1 sd_setImageWithURL:[NSURL URLWithString:self.dataSource[indexPath.row]]];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
