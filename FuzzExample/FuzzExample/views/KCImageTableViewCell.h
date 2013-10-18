//
//  KCImageTableViewCell.h
//  FuzzExample
//
//  Created by Yee Peng Chia on 10/17/13.
//  Copyright (c) 2013 Keen Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCImageTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *thumbnailView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *idLabel;

@end
