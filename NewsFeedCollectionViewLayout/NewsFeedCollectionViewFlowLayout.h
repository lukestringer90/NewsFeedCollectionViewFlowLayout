//
//  NewsFeedCollectionViewFlowLayout.h
//  NewsFeedCollectionViewLayout
//
//  Created by Luke on 29/06/2013.
//  Copyright (c) 2013 Luke Stringer. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *  This enum defines the layout configurations avaiable for a section.
 *  A section corresponds to a page in the paged collection view.
 *
 *  An array of SectionLayoutConfigurations is passed to this class and used
 *  in working out the number of items in a section (i.e. layout) and the total
 *  nuumber of sections in the collectionview
 */
typedef NS_ENUM(NSInteger, SectionLayoutConfiguration) {
    SectionLayoutConfigurationA,
    SectionLayoutConfigurationB,
    SectionLayoutConfigurationC,
    SectionLayoutConfigurationD
};

@interface NewsFeedCollectionViewFlowLayout : UICollectionViewFlowLayout

- (instancetype)initWithSectionLayoutConfigurations:(NSArray *)layoutConfigurations;

@property (nonatomic, strong) NSArray *sectionLayoutConfigurations;

- (NSInteger )numberOfItemsInSection:(int)section;
- (NSInteger)numberOfSections;

@end
