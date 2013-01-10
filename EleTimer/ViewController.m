//
//  ViewController.m
//  EleTimer
//
//  Created by makai on 13-1-10.
//  Copyright (c) 2013年 makai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{
    [timeLabel release], timeLabel = nil;
    [beginDate release], beginDate = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    beginDate = [[NSDate date] retain];
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 320 - 100, 100)];
    [timeLabel setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:38]];
    [timeLabel setBackgroundColor:[UIColor clearColor]];
    [timeLabel setTextAlignment:UITextAlignmentCenter];
    [timeLabel setTextColor:[UIColor whiteColor]];
    [timeLabel setText:@"00:00:00"];
    [self.view addSubview:timeLabel];
}

- (void)onTimer
{
    NSDate *nowDate = [NSDate date];
    NSCalendar *chineseClendar = [[NSCalendar alloc ] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags =  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [chineseClendar components:unitFlags fromDate:beginDate toDate:nowDate options:0];
    NSLog(@"%d:%d:%d", dateComponent.hour, dateComponent.minute, dateComponent.second);
	timeLabel.text = [NSString stringWithFormat:@"%0.2d:%0.2d:%0.2d", dateComponent.hour, dateComponent.minute, dateComponent.second];
    [chineseClendar release], chineseClendar = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
