//
//  NewsFeedCollectionViewFlowLayout.m
//  NewsFeedCollectionViewLayout
//
//  Created by Luke on 29/06/2013.
//  Copyright (c) 2013 Luke Stringer. All rights reserved.
//

#import "NewsFeedCollectionViewFlowLayout.h"

@implementation NewsFeedCollectionViewFlowLayout

#pragma mark - Public
- (instancetype)initWithSectionLayoutConfigurations:(NSArray *)layoutConfigurations {
    self = [super init];
    if (self) {
        self.sectionLayoutConfigurations = layoutConfigurations;
    }
    return self;
}

- (NSInteger)numberOfSections {
    return [self.sectionLayoutConfigurations count];
}

- (NSInteger)numberOfItemsInSection:(int)section {
    SectionLayoutConfiguration layoutConfiguration = [self.sectionLayoutConfigurations[section] intValue];
    switch (layoutConfiguration) {
        case SectionLayoutConfigurationA:
            return 3;
            break;
        case SectionLayoutConfigurationB:
            return 4;
            break;
        case SectionLayoutConfigurationC:
            return 5;
            break;
        case SectionLayoutConfigurationD:
            return 6;
        default:
            break;
    }
    return 0;
}

#pragma mark - UICollectionViewFlowLayout
- (CGSize)collectionViewContentSize {
    return CGSizeMake([self numberOfSections] * 1024, 748);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* attributesToReturn = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes* attributes in attributesToReturn) {
        if (nil == attributes.representedElementKind) {
            NSIndexPath* indexPath = attributes.indexPath;
            attributes.frame = [self layoutAttributesForItemAtIndexPath:indexPath].frame;
        }
    }
    return attributesToReturn;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes* currentItemAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    if (!currentItemAttributes) {
        currentItemAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    }
    
    float collectionViewHeight = self.collectionView.frame.size.height;
    float collectionViewWidth = self.collectionView.frame.size.width;
    
    // Work out the x origin offset for the section
    float xOffset = indexPath.section * collectionViewWidth;
    
    // Compute the frame for the cell at the indexpath.
    // This is based on what layout configuration is being used for the section
    // and what row the cell is at
    SectionLayoutConfiguration sectionLayoutConfig = [self.sectionLayoutConfigurations[indexPath.section] intValue];
    CGRect frame = CGRectZero;
    switch (sectionLayoutConfig) {
        case SectionLayoutConfigurationA:
            frame = [self layoutAFrameForRow:indexPath.row
                         collectionViewWidth:collectionViewWidth
                        collectionViewHeight:collectionViewHeight
                                     xOffset:xOffset];
            break;
        case SectionLayoutConfigurationB:
            frame = [self layoutBFrameForRow:indexPath.row
                         collectionViewWidth:collectionViewWidth
                        collectionViewHeight:collectionViewHeight
                                     xOffset:xOffset];
            break;
        case SectionLayoutConfigurationC:
            frame = [self layoutCFrameForRow:indexPath.row
                         collectionViewWidth:collectionViewWidth
                        collectionViewHeight:collectionViewHeight
                                     xOffset:xOffset];
            break;
        case SectionLayoutConfigurationD:
            frame = [self layoutDFrameForRow:indexPath.row
                         collectionViewWidth:collectionViewWidth
                        collectionViewHeight:collectionViewHeight
                                     xOffset:xOffset];
            break;
            
        default:
            break;
    }
    
    currentItemAttributes.frame = frame;
    return currentItemAttributes;
}

#pragma mark - Private
- (CGRect)layoutAFrameForRow:(NSUInteger)row collectionViewWidth:(CGFloat)width collectionViewHeight:(CGFloat)height xOffset:(CGFloat)xOffset {
    
    float xGap = 20;
    float yGap = 20;
    
    float startingX = xOffset + xGap;
    float startingY = yGap;
    
    float usableWidth = width - (3 * xGap);
    float column1UsableHeight = height - (2 * yGap);
    float column2UsableHeight = height - (3 * yGap);
    
    float column1WidthPercentage = 0.65;
    float column2WidthPercentage = 1 - column1WidthPercentage;
    
    float column2Row1HeightPercentage = 0.55;
    float column2Row2HeightPercentage = 1 - column2Row1HeightPercentage;
    
    CGRect frame = CGRectZero;
    switch (row) {
        case 0:
            frame.size = CGSizeMake(usableWidth * column1WidthPercentage, column1UsableHeight);
            frame.origin = CGPointMake(startingX, startingY);
            break;
        case 1:
            frame.size =  CGSizeMake(usableWidth * column2WidthPercentage, column2UsableHeight * column2Row1HeightPercentage);
            frame.origin = CGPointMake(startingX + xGap + (usableWidth * column1WidthPercentage), startingY);
            break;
        case 2:
            frame.size =  CGSizeMake(usableWidth * column2WidthPercentage, column2UsableHeight * column2Row2HeightPercentage);
            frame.origin = CGPointMake(startingX + xGap + (usableWidth * column1WidthPercentage), startingY + yGap + (column2UsableHeight * column2Row1HeightPercentage));
            break;
        default:
            break;
    }
    return frame;
    
    
}

- (CGRect)layoutBFrameForRow:(NSUInteger)row collectionViewWidth:(CGFloat)width collectionViewHeight:(CGFloat)height xOffset:(CGFloat)xOffset {
    
    float xGap = 20;
    float yGap = 20;
    
    float startingX = xOffset + xGap;
    float startingY = yGap;
    
    float usableWidth = width - (3 * xGap);
    float column1UsableHeight = height - (4 * yGap);
    float column2UsableHeight = height - (2 * yGap);
    
    float column1WidthPercentage = 0.55;
    float column2WidthPercentage = 1 - column1WidthPercentage;
    
    
    CGRect frame = CGRectZero;
    switch (row) {
        case 0:
            frame.size =  CGSizeMake(usableWidth * column1WidthPercentage, column1UsableHeight/3);
            frame.origin = CGPointMake(startingX, startingY);
            break;
        case 1:
            frame.size =  CGSizeMake(usableWidth * column1WidthPercentage, column1UsableHeight/3);
            frame.origin = CGPointMake(startingX, startingY + yGap + column1UsableHeight/3);
            break;
        case 2:
            frame.size =  CGSizeMake(usableWidth * column1WidthPercentage, column1UsableHeight/3);
            frame.origin = CGPointMake(startingX , startingY + (yGap * 2) + (column1UsableHeight * 2/3));
            break;
        case 3:
            frame.size = CGSizeMake(usableWidth * column2WidthPercentage, column2UsableHeight);
            frame.origin = CGPointMake(startingX + xGap + (usableWidth * column1WidthPercentage), startingY);
            break;
            
        default:
            break;
    }
    return frame;
    
    
}

- (CGRect)layoutCFrameForRow:(NSUInteger)row collectionViewWidth:(CGFloat)width collectionViewHeight:(CGFloat)height xOffset:(CGFloat)xOffset {
    
    float xGap = 20;
    float yGap = 20;
    
    float startingX = xOffset + xGap;
    float startingY = yGap;
    
    float row1UsableWidth = width - (4 * xGap);
    float row2UsableWidth = width - (3 * xGap);
    
    float usableHeight = height - (3 * yGap);
    
    CGRect frame = CGRectZero;
    switch (row) {
        case 0:
            frame.size = CGSizeMake(row1UsableWidth/3, usableHeight/2);
            frame.origin = CGPointMake(startingX, startingY);
            break;
        case 1:
            frame.size =  CGSizeMake(row1UsableWidth/3, usableHeight/2);
            frame.origin = CGPointMake(startingX + row1UsableWidth/3 + xGap, startingY);
            break;
        case 2:
            frame.size =  CGSizeMake(row1UsableWidth/3, usableHeight/2);
            frame.origin = CGPointMake(startingX + (row1UsableWidth * 2/3) + (2 * xGap), startingY);
            break;
        case 3:
            frame.size =  CGSizeMake(row2UsableWidth/2, usableHeight/2);
            frame.origin = CGPointMake(startingX, startingY + usableHeight/2 + yGap);
            break;
        case 4:
            frame.size =  CGSizeMake(row2UsableWidth/2, usableHeight/2);
            frame.origin = CGPointMake(startingX + row2UsableWidth/2 + xGap, startingY + usableHeight/2 + yGap);
            break;
        default:
            break;
    }
    return frame;
    
}

- (CGRect)layoutDFrameForRow:(NSUInteger)row collectionViewWidth:(CGFloat)width collectionViewHeight:(CGFloat)height xOffset:(CGFloat)xOffset {
    
    float xGap = 20;
    float yGap = 20;
    
    float startingX = xOffset + xGap;
    float startingY = yGap;
    
    float usableWidth = width - (3 * xGap);
    float usableHeight = height - (2 * yGap);
    
    CGRect frame = CGRectZero;
    switch (row) {
        case 0:
            frame.size = CGSizeMake(usableWidth/2, usableHeight);
            frame.origin = CGPointMake(startingX, startingY);
            break;
        case 1:
            frame.size =  CGSizeMake(usableWidth/2, usableHeight);
            frame.origin = CGPointMake(startingX + usableWidth/2 + xGap, startingY);
            break;
        default:
            break;
    }
    return frame;
    
}



@end
