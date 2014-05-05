//
//  ViewController.h
//  ZxingDemo
//
//  Created by NCXT on 29/04/2014.
//  Copyright (c) Năm 2014 NCXT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXingWidgetController.h"

@interface ViewController : UIViewController<ZXingDelegate>

{
    ZXingWidgetController *widController;
    AVCaptureVideoPreviewLayer *prevLayer;
}
@property (nonatomic, retain) IBOutlet UILabel *resultsView;
@property (nonatomic, copy) NSString *resultsToDisplay;


- (IBAction)scanPressed:(id)sender;

@end
