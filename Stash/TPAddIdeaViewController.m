//
//  TPAddIdeaViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPAddIdeaViewController.h"
#import "TPIdea.h"
#import "TPIconSelectionViewController.h"

@interface TPAddIdeaViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (strong, nonatomic) TPIdea *idea;


@property (weak, nonatomic) IBOutlet UITextField *workingTitle;
@property (weak, nonatomic) IBOutlet UITextView *description;


@end

@implementation TPAddIdeaViewController
  

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  self.workingTitle.delegate = self;
  self.description.delegate = self;
  
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];

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
  idea.appDescription = self.description.text;
  [self.modelController.ideas addObject:idea];
  
}

- (IBAction)didSelectIcon:(UIStoryboardSegue *)segue
{
  TPIconSelectionViewController *selectionVC = segue.sourceViewController;
  self.icon.image = selectionVC.selectedIcon;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return NO;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  
  if([text isEqualToString:@"\n"]) {
    [textView resignFirstResponder];
    return NO;
  }
  
  return YES;
}
@end
