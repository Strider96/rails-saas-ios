//
//  YFProductsViewController.h
//  rails-saas-ios
//
//  Created by Chris Richards on 07/01/2013.
//  Copyright (c) 2013 Yellow Feather Ltd. All rights reserved.
//

#import "YFPullToRefreshView.h"
#import "YFEditProductViewController.h"
#import "YFManagedTableViewController.h"

@interface YFProductsViewController : YFManagedTableViewController

@property (strong, nonatomic) YFEditProductViewController *editViewController;

- (Class)entityClass;

- (void)refresh:(id)sender;

- (void)signOut:(id)sender;

@end
