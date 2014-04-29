//
//  TPViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPViewController.h"
#import "TPModelController.h"
#import "TPAddIdeaViewController.h"
#import "TPDetailViewController.h"
#import "TPCollectionViewCell.h"
#import "TPIdea.h"


@interface TPViewController () <UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) TPModelController *modelController;
@end


@implementation TPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

  
  // Instantiates a Model Controller and Ideas Array
  
  self.modelController = [TPModelController new];
  self.modelController.ideas = [NSMutableArray new];
  
  
  // Singleton that saves 450 png icons to disk for fast loading (in .pch)
  [[TPIconLibrary sharedLibrary]loadIcons];

}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  // Reload collection view to see icons that were just added
  [self.collectionView reloadData];
  
}
#pragma mark - Browse Item Button

//Methods to create the bottom half view and animate the panel slide
- (IBAction)browseItems:(id)sender {
  
  //Need clarification on how this works
  UIView *browseView = [(UIButton *)sender superview];
  
  [UIView animateWithDuration:0.4 animations:^{
    browseView.frame = CGRectMake(0, self.view.bounds.size.height, 320, 0);
  }];
}

#pragma mark - CollectionView DataSource/Delegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.modelController.ideas.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
  TPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  TPIdea *idea = [self.modelController.ideas objectAtIndex:[[[self.collectionView indexPathsForSelectedItems] lastObject] row]];
  
  cell.iconImage.image = idea.appIcon;
  
  
  return cell;
}

#pragma mark - Add Idea / Browse Idea Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"quickAdd"]) {
    TPAddIdeaViewController *addVC = segue.destinationViewController;
    addVC.modelController = self.modelController;
  } else if ([segue.identifier isEqualToString:@"detailView"]) {
    
    TPIdea *selectedIdea = [self.modelController.ideas objectAtIndex:[[[self.collectionView indexPathsForSelectedItems] lastObject] row]];
    
    TPDetailViewController *detailVC = segue.destinationViewController;
    detailVC.selectedIdea = selectedIdea;
  }
}















@end
