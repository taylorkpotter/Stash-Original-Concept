//
//  TPIconLibrary.m
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPIconLibrary.h"

@interface TPIconLibrary ()

@property (strong, nonatomic) NSMutableArray *images;

@end

@implementation TPIconLibrary

//
// Class method/singleton used by called sharedLibrary
//
+ (instancetype)sharedLibrary
{
  static TPIconLibrary *library = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    library = [[TPIconLibrary alloc]init];
  });
  
  return library;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    _images = [[NSMutableArray alloc]init];
  }
  return self;
}

- (void)loadIcons
{
  
  
  NSString *imageFilePath = [self imagesFilePath];
  
  if ([[NSFileManager defaultManager]fileExistsAtPath:[self imagesFilePath]]) {
    
    _images = [NSKeyedUnarchiver unarchiveObjectWithFile:imageFilePath];
    
  } else {
    
    for (int i = 1; i <= 450; i++) {
      
      NSString *imageName = [NSString stringWithFormat:@"icon_%d", i];
      NSString *imagePath = [[NSBundle mainBundle]pathForResource:imageName ofType:@"png"];
      
      [self.images addObject:imagePath];
      
    }
    
    [NSKeyedArchiver archiveRootObject:self.images toFile:[self imagesFilePath]];
    
  }
}

- (NSArray *)icons
{
  return self.images;
}

#pragma mark - Helper Methods

- (NSString *)imagesFilePath
{
  NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = documentsDirectories.firstObject;
  return [documentsDirectory stringByAppendingPathComponent:@"IconsArchive.data"];
}

@end
