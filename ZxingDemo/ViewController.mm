//
//  ViewController.m
//  ZxingDemo
//
//  Created by NCXT on 29/04/2014.
//  Copyright (c) Năm 2014 NCXT. All rights reserved.
//

#import "ViewController.h"
#import "MultiFormatReader.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize resultsToDisplay,resultsView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)scanPressed:(id)sender
{
    widController =
    [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO];
    NSMutableSet *readers = [[NSMutableSet alloc ] init];
    
    MultiFormatReader* reader = [[MultiFormatReader alloc] init];
    [readers addObject:reader];
    
    widController.readers = readers;
    
    
//    NSLog(@"%f",widController.overlayView.cropRect.size.width);
//    NSLog(@"%f",widController.overlayView.cropRect.size.height);
//    widController.overlayView.cropRect = CGRectMake(0, 0, 0, 0);
    
    
//    NSBundle *mainBundle = [NSBundle mainBundle];
//    widController.soundToPlay =
//    [NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
    [self.view addSubview:widController.view];
    // [self presentViewController:widController animated:YES completion:nil];
    

}
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskPortrait;
}
#pragma mark -
#pragma mark ZXingDelegateMethods

- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result {
    self.resultsToDisplay = result;
    if (self.isViewLoaded) {
        [resultsView setText:resultsToDisplay];
        [resultsView setNeedsDisplay];
    }
    [controller.view removeFromSuperview];
    // [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller {
    [controller.view removeFromSuperview];
    // [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    self.resultsView = nil;
}


@end
