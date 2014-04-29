//
//  TPAddIdeaViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPAddIdeaViewController.h"
#import "TPIdea.h"

@interface TPAddIdeaViewController () <UITextFieldDelegate>
@property (strong, nonatomic) TPIdea *idea;


@property (weak, nonatomic) IBOutlet UITextField *workingTitle;
@property (weak, nonatomic) IBOutlet UITextView *description;

//@property (weak, nonatomic) TPIconSelectionViewController *iconViewController;


@end

@implementation TPAddIdeaViewController
  

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  self.workingTitle.delegate = self;
  
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
//  self.savedIcon = [UIImageView new];
//  self.icon.image = self.savedIcon.image;

}

- (IBAction)doneAdding:(id)sender {
  
  [self saveIdea];
  [self dismissViewControllerAnimated:YES completion:^{
    
  }];
}


- (IBAction)discardIdea:(id)sender {
  [self dismissViewControllerAnimated:YES completion:^{
    
  }];
}

- (void)saveIdea
{
  
  TPIdea *idea = [TPIdea new];
  idea.appIcon = self.icon.image;
  idea.workingTitle = self.workingTitle.text;
  [self.modelController.ideas addObject:idea];
  
}

-(BOOL)textFieldShouldRerturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return NO;
}
@end
