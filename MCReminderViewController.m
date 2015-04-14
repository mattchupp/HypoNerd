//
//  MCReminderViewController.m
//  HypoNerd
//
//  Created by Matthew Chupp on 3/17/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCReminderViewController.h"

@interface MCReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation MCReminderViewController

- (IBAction)addReminder:(id)sender {
    
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // set the tab bar item's title
        self.tabBarItem.title = @"Time";
        
        // create a UIImage from a file
        // This will use Hypno@2x.png on retina display devices
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        
        // put that image on the tab bar item
        self.tabBarItem.image = image;
        
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"MCReminderViewController did load");
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}


@end
