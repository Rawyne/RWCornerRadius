//
//  TableViewCell.m
//  Demo
//
//  Created by 许宗城 on 16/7/10.
//  Copyright © 2016年 许宗城. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#import "UIImageView+RWCornerRadius.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.image0 = ({
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
            [self.contentView addSubview:image];
//            [image mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.centerY.equalTo(self.contentView);
//                make.left.equalTo(self.contentView);
//                make.size.mas_equalTo(CGSizeMake(60, 60));
//            }];
            
//            image.layer.cornerRadius = 20;
//            image.layer.masksToBounds = YES;
            
            image.rw_cornerRadius = 30;
            
            image;
        });
        
        
        self.image1 = ({
            UIImageView *image = [[UIImageView alloc] init];
            [self.contentView addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView);
                make.left.equalTo(self.image0.mas_right);
                make.size.mas_equalTo(CGSizeMake(60, 60));
            }];
//            image.layer.cornerRadius = 20;
//            image.layer.masksToBounds = YES;
            
            image.rw_cornerRadius = 30;

            
            image;
        });
        
//        self.image2 = ({
//            UIImageView *image = [[UIImageView alloc] init];
//            [self.contentView addSubview:image];
//            [image mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(self.image1.mas_right);
//                make.centerY.equalTo(self.contentView);
//                make.size.mas_equalTo(CGSizeMake(40, 40));
//            }];
//            
////            image.layer.cornerRadius = 20;
////            image.layer.masksToBounds = YES;
//            image.rw_cornerRadius = 20;
//            
//            image;
//        });
//        
//        self.image3 = ({
//            UIImageView *image = [[UIImageView alloc] init];
//            [self.contentView addSubview:image];
//            [image mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(self.image2.mas_right);
//                make.centerY.equalTo(self.contentView);
//                make.size.mas_equalTo(CGSizeMake(40, 40));
//            }];
//            
////            image.layer.cornerRadius = 20;
////            image.layer.masksToBounds = YES;
//            image.rw_cornerRadius = 20;
//            
//            image;
//        });
        
        
        
        
    }
    return self;
}

@end
