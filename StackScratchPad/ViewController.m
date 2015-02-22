//
//  ViewController.m
//  StackScratchPad
//
//  Created by Louis Tur on 2/21/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

#import "ViewController.h"
#import "NSString+FontAwesome.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // -- for: http://stackoverflow.com/questions/28653722/font-awesome-ios-icons-all-the-same -- //
    /* Steps Taken:
     *  - File > Add File > Added ios-fontawesome in it entirety (copied folder)
     *  - Removed all .m files from fontawesome besides NSString+FontAwesome.m from compile sources
     *  - Added FontAwesome.tff to info.plist key Fonts Provided By Application
     *
     *  - Compiled for iPhone 5s Sim, 8.1 using XCode 6.1.1
     */
    
    [self addFontAwesomeFirst]; // my implementation
    [self addFontAwesomeSecond];// question's implementation
}

-(void)addFontAwesomeFirst{
    
    // -- TOP CONTAINER VIEW CREATION -- //
    UIView * topContentView = [[UIView alloc] initWithFrame:CGRectZero];
    [topContentView setBackgroundColor:[UIColor blueColor]];
    [topContentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:topContentView];
    
    // -- CONTENT VIEW CONSTRAINTS -- //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{ @"contentView" : topContentView } ]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView(==200)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{ @"contentView" : topContentView } ]];
    
    // -- UILABEL SETUP -- //
    UILabel * fontAwesomeLabel       = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    fontAwesomeLabel.backgroundColor = [UIColor yellowColor];
    fontAwesomeLabel.font            = [UIFont fontWithName:kFontAwesomeFamilyName size:24.0];
    fontAwesomeLabel.text            = [NSString fontAwesomeIconStringForEnum:FAScissors];
    fontAwesomeLabel.textAlignment   = NSTextAlignmentCenter;
    
    [topContentView addSubview:fontAwesomeLabel];

}

-(void)addFontAwesomeSecond{
    
    // -- LOWER CONTAINER VIEW CREATION -- //
    UIView * lowerContentView = [[UIView alloc] initWithFrame:CGRectZero];
    [lowerContentView setBackgroundColor :[UIColor blueColor]];
    [lowerContentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:lowerContentView];
    
    // -- CONTENT VIEW CONSTRAINTS -- //
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{ @"contentView" : lowerContentView } ]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contentView(==200)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{ @"contentView" : lowerContentView } ]];
    
    // -- UILABEL SETUP -- //
    UILabel * label1       = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    label1.backgroundColor = [UIColor yellowColor];
    label1.textAlignment   = NSTextAlignmentCenter;
    
    id github  = [NSString fontAwesomeIconStringForEnum:FAGithub];
    id twitter = [NSString fontAwesomeIconStringForEnum:FATwitter];
    
    label1.font = [UIFont fontWithName:kFontAwesomeFamilyName size:32.f];
    label1.text = [NSString stringWithFormat:@"%@ %@", github, twitter];
    
    [lowerContentView addSubview:label1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
