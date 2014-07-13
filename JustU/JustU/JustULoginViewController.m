//
//  JustULoginViewController.m
//  JustU
//
//  Created by Anusha Tondapu on 13/07/14.
//  Copyright (c) 2014 AmoghAnusha. All rights reserved.
//

#import "JustULoginViewController.h"
#import "JSONHelper.h"
#import "JustUResourceNameConstants.h"
#import "JustUEnums.h"
#import "JustUNewsSource.h"
#import "JustUNewsTableViewController.h"

@interface JustULoginViewController ()

@end

@implementation JustULoginViewController
@synthesize listOfNewsSources;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnLoginClicked:(UIButton *)sender {
    [self loadNewsContentForUser];
    
    
    UITabBarController *tabBar = [self.storyboard instantiateViewControllerWithIdentifier:@"JustUTabBar"];
    [self.navigationController pushViewController:tabBar animated:YES];
    JustUNewsTableViewController *firstview=[tabBar.viewControllers objectAtIndex:0];
    firstview.listOfNewsSources=self.listOfNewsSources;
}

- (IBAction)btnSignupClicked:(UIButton *)sender {
}

- (void)loadNewsContentForUser
{
    NSString* newsWebserviceURL;
    listOfNewsSources = [NSMutableArray array];
    
    
    
    newsWebserviceURL = [JustUResourceNameConstants getResourceStringValue:@"GoogleAPINews" fromFile:@"WebserviceURLs"];
    NSLog(@"%@",newsWebserviceURL);
    
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //dispatch_async(queue, ^{
        
        // Load the JSON string from our web serivce (in a background thread)
        NSDictionary * responseReceived = [JSONHelper loadJSONDataFromURL:newsWebserviceURL];
        
        int responseStatusCode = [[responseReceived valueForKey:@"responseStatus"] intValue];
        
        if (responseStatusCode == RESPONSE_OK) {
            NSDictionary *responseData = [responseReceived valueForKey:@"responseData"];
            if (responseData != nil) {
                NSArray *newsSources = [responseData valueForKey:@"entries"];
                if (newsSources != nil) {
                    
                    listOfNewsSources = [NSMutableArray arrayWithCapacity:newsSources.count];
                    //iterate over each source
                    for (NSDictionary *oneNewsSource in newsSources) {
                        JustUNewsSource *newsSource = [[JustUNewsSource alloc]init];
                        newsSource.title = [oneNewsSource valueForKey:@"title"];
                        newsSource.contentSnippet = [oneNewsSource valueForKey:@"contentSnippet"];
                        newsSource.link = [oneNewsSource valueForKey:@"link"];
                        newsSource.url = [oneNewsSource valueForKey:@"url"];
                        [listOfNewsSources addObject:newsSource];
                    }
                }
                else
                {
                    [JustULoginViewController showAlertMessage:[JustUResourceNameConstants getResourceStringValue:@"EmptyResponse" fromFile:@"ErrorPopupMessages"]];
                }
                
            }
            else
            {
                [JustULoginViewController showAlertMessage:[JustUResourceNameConstants getResourceStringValue:@"EmptyResponse" fromFile:@"ErrorPopupMessages"]];
            }
        }
    //});

}

+(void)showAlertMessage : (NSString *)messageToShow {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:messageToShow delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"LoginToHomepageSegue"]) {
        
        [self loadNewsContentForUser];
        
        JustUNewsTableViewController *destViewController = segue.destinationViewController;
        destViewController.listOfNewsSources = self.listOfNewsSources;
    }
}
*/

@end
