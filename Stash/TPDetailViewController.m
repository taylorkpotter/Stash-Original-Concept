//
//  TPDetailViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPDetailViewController.h"



@interface TPDetailViewController ()
@property (nonatomic, weak) TPModelController *modelController;

@property (weak, nonatomic) IBOutlet UITextView *description;
@property (weak, nonatomic) IBOutlet UILabel *workingTitleSelected;
@property (weak, nonatomic) IBOutlet UIImageView *appIconSelected;



@end

@implementation TPDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
  self.workingTitleSelected.text = self.selectedIdea.workingTitle;
  self.appIconSelected.image = self.selectedIdea.appIcon;
  self.description.text = self.selectedIdea.appDescription;
  
  
  
  
  
  
  NSLog(@"My Description Is: %@", self.selectedIdea.appDescription);
  
}

@end
