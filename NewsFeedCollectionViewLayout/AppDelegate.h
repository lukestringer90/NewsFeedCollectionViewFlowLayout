//
//  AppDelegate.h
//  NewsFeedCollectionViewLayout
//
//  Created by Luke on 29/06/2013.
//  Copyright (c) 2013 Luke Stringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsFeedCollectionViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NewsFeedCollectionViewController *viewController;

@end
