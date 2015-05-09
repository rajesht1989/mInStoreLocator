//
//  CollectionViewCell.m
//  mStore
//
//  Created by Rajesh on 5/7/15.
//

#import "MSCollectionViewCell.h"

@implementation MSCollectionViewCell

- (void)initializeWithOwner:(id)owner
{
//    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (!_imgItem)
    {
        [self.layer setCornerRadius:4];
        _imgItem = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-100)/2, 5, 100, 80)];
        [_imgItem setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin| UIViewAutoresizingFlexibleRightMargin];
        [self addSubview:_imgItem];
        
        _lblName = [[UILabel alloc] initWithFrame:CGRectMake(10, 85, self.frame.size.width - 20, 50)];
        [_lblName setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        [_lblName setFont:[UIFont systemFontOfSize:15 weight:.4]];
        [_lblName setNumberOfLines:0];
        [_lblName setTextColor:[UIColor darkGrayColor]];
        [self addSubview:_lblName];
        
        _lblPrice = [[UILabel alloc] initWithFrame:CGRectMake(10, 85 + 50, 60, 24)];
        [_lblPrice setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin];
        [_lblPrice setFont:[UIFont systemFontOfSize:13 weight:.4]];
        [_lblPrice setTextColor:[UIColor darkGrayColor]];
        [self addSubview:_lblPrice];
        
        _btnLocate = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 80 - 5, 85 + 50, 70, 24)];
        [_btnLocate setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
        [_btnLocate setTitle:@"Locate" forState:UIControlStateNormal];
        [_btnLocate.titleLabel setFont:[UIFont systemFontOfSize:13 weight:.4]];
        [_btnLocate setBackgroundColor:[UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1]];
        [_btnLocate  setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_btnLocate.layer setCornerRadius:4];
        [_btnLocate addTarget:owner action:@selector(locateTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnLocate];
    }
}

@end
