//
//  TPIconLibrary.h
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPIconLibrary : NSObject

+ (instancetype)sharedLibrary;

- (NSArray *)icons;
- (void)loadIcons;

@end
