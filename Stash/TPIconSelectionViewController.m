//
//  TPIconSelectionViewController.m
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import "TPIconSelectionViewController.h"
#import "TPIconSelectionViewCell.h"




@interface TPIconSelectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic)  TPAddIdeaViewController *addIdeaViewController;
@property (strong, nonatomic) UIImage *selectedIcon;


@end

@implementation TPIconSelectionViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (IBAction)doneSelectingIcon:(id)sender {
  [self dismissViewControllerAnimated:YES completion:^{
  
    self.addIdeaViewController.icon.image = self.selectedIcon;
    NSLog(@"%@", self.addIdeaViewController.icon.image);

    
  }];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return [[[TPIconLibrary sharedLibrary]icons]count];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  TPIconSelectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Icon" forIndexPath:indexPath];
  
  NSString *imagePath = [[[TPIconLibrary sharedLibrary]icons]objectAtIndex:indexPath.row];
  UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
  cell.iconImage.image = image;
  
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
  TPIconSelectionViewCell *cell = (TPIconSelectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
  
  cell.backgroundColor = [UIColor lightGrayColor];
    self.selectedIcon = cell.iconImage.image;
    NSLog(@"%@", self.selectedIcon);

  
}

@end
