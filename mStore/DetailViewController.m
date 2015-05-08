//
//  DetailViewController.m
//  mStore
//
//  Created by Rajesh on 5/5/15.
//

#import "DetailViewController.h"
#import "UIImage+Color.h"
#import "MStore.h"
#import "MSLoginViewController.h"
#import "MSCollectionViewCell.h"

@interface DetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    BOOL isListView;
    UICollectionView *collectionView;
}
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//            
//        // Update the view.
//        [self configureView];
//    }
//}
//
//- (void)configureView {
//    // Update the user interface for the detail item.
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1]];
    [[self.navigationController navigationBar] setTintColor:[UIColor whiteColor]];
    [[self.navigationController navigationBar] setBackgroundImage:NAVIGATION_BAR_IMAGE forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [self setTitle:[self.category name]];
   
    collectionView =[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
    [collectionView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.backgroundColor=[UIColor clearColor];
    [collectionView registerClass:[MSCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    [self.view addSubview:collectionView];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"List"] style:UIBarButtonItemStylePlain target:self action:@selector(layoutBarButtonTapped:)]];
}

- (void)backPressed:(UIButton *)btnBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)layoutBarButtonTapped:(UIBarButtonItem *)barbutton
{
    NSString *strImageName;
    if (isListView)
    {
        strImageName = @"List";
    }
    else
    {
        strImageName = @"gridicon";
    }
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:strImageName] style:UIBarButtonItemStylePlain target:self action:@selector(layoutBarButtonTapped:)]];
    isListView = !isListView;
    [collectionView reloadData];
}

#pragma mark CollectionView Data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.category.items count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionViewLocal cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCell = @"collectionViewCell";
    MSCollectionViewCell *cell = [collectionViewLocal dequeueReusableCellWithReuseIdentifier:strCell forIndexPath:indexPath];
    [cell initialize];
    [cell setBackgroundColor:[UIColor whiteColor]];
    MSItems *item = [[_category items] objectAtIndex:indexPath.row];
    [cell.imgItem setImage:[UIImage imageNamed:item.itemsIdentifier]];
    [cell.lblName setText:item.name];
    [cell.lblPrice setText:item.price];
    [cell.btnLocate setTag:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionViewLocal layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (isListView)
    {
        return CGSizeMake(self.view.frame.size.width - 20, self.view.frame.size.width/2 + 10);
    }
    else
    {
        return CGSizeMake(self.view.frame.size.width/2 - 18, self.view.frame.size.width/2 + 10);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
