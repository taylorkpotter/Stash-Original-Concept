//
//  TPAddIdeaViewController.h
//  Stash
//
//  Created by Taylor Potter on 4/28/14.
//  Copyright (c) 2014 potter.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPModelController.h"


@interface TPAddIdeaViewController : UIViewController
@property (nonatomic, weak) TPModelController *modelController;
//@property (strong, nonatomic) UIImageView *savedIcon;
@property (weak, nonatomic) IBOutlet UIImageView *icon;


@end
