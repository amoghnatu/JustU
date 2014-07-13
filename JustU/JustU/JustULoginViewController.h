//
//  JustULoginViewController.h
//  JustU
//
//  Created by Anusha Tondapu on 13/07/14.
//  Copyright (c) 2014 AmoghAnusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JustUNewsSource.h"

@interface JustULoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@property (strong,nonatomic) NSMutableArray *listOfNewsSources;

+(void)showAlertMessage : (NSString *)messageToShow;

@end
