//
//  ViewController.m
//  NewsFeedCollectionViewLayout
//
//  Created by Luke on 29/06/2013.
//  Copyright (c) 2013 Luke Stringer. All rights reserved.
//

#import "NewsFeedCollectionViewController.h"
#import "NewsFeedCollectionViewFlowLayout.h"

static NSString *CollectionViewCellID = @"CollectionViewCellID";

@interface NewsFeedCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *cellColours;
@property (nonatomic, strong) NewsFeedCollectionViewFlowLayout *flowLayout;
@end

@implementation NewsFeedCollectionViewController

- (id)init {
    self = [super init];
    if (self) {
        
        self.cellColours = @[
                             [UIColor redColor],
                             [UIColor blueColor],
                             [UIColor greenColor],
                             [UIColor yellowColor],
                             [UIColor orangeColor],
                             [UIColor purpleColor],
                             [UIColor brownColor],
                             [UIColor cyanColor]
                             ];
    }
    return  self;
}


#pragma mark - View setup
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadView {
    [super loadView];
    
    [self setupCollectionViewFlowLayout];
    [self setupCollectionView];
}

- (void)setupCollectionViewFlowLayout {
    self.flowLayout = [[NewsFeedCollectionViewFlowLayout alloc] init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumInteritemSpacing = 0.0;
    self.flowLayout.minimumLineSpacing = 0.0f;
    
    // Here we setup the layout configurations for the sections we want.
    // Each section corresponds to a page as we have turned on paging for the collectionview.
    // The number of elements in the sectionLayoutConfigurations array specifies how many pages there are
    // and what configuration of cells should be used for that section and page.
    self.flowLayout.sectionLayoutConfigurations = @[@(SectionLayoutConfigurationA),
                                                    @(SectionLayoutConfigurationB),
                                                    @(SectionLayoutConfigurationC),
                                                    @(SectionLayoutConfigurationD)];
}

- (void)setupCollectionView {
    CGRect frame = CGRectMake(0, 0, 748, 1024);
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.flowLayout];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellID];
    
    self.collectionView .autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.collectionView .backgroundColor = [UIColor whiteColor];
    self.collectionView .pagingEnabled = YES;
    
    self.collectionView .delegate = self;
    self.collectionView .dataSource = self;
    
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.flowLayout numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.flowLayout numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellID forIndexPath:indexPath];
    
    // Colour the cell
    int colourIndex = indexPath.row;
    UIColor *cellColour = self.cellColours[colourIndex];
    cell.contentView.backgroundColor = cellColour;
    
    return cell;
}


#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get the size from the NewsFeedCollectionViewFlowLayout instance (a subclass of UICollectionViewFlowLayout)
    return [collectionViewLayout layoutAttributesForItemAtIndexPath:indexPath].size;
    
}

#pragma mark - Private

@end

