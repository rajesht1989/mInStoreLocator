//
//  CollectionViewCell.h
//  mStore
//
//  Created by Rajesh on 5/7/15.
//

#import <UIKit/UIKit.h>

@interface MSCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *imgItem;
@property(nonatomic,strong)UILabel *lblName;
@property(nonatomic,strong)UILabel *lblPrice;
@property(nonatomic,strong)UIButton *btnLocate;

- (void)initialize;

@end
