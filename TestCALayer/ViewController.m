//
//  ViewController.m
//  TestCALayer
//
//  Created by Fabricio Tofoli on 5/1/14.
//  Copyright (c) 2014 nklab. All rights reserved.
//

#import "ViewController.h"
#import "UICATileLayerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapRecognizer;
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refresh)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) refresh
{
    static bool gray = true;
    
    gray = !gray;

    for (UICATileLayerView *view in self.view.subviews)
    {
        if ([view class] == [UICATileLayerView class])
        {
            if (gray)
                view.color = [UIColor grayColor];
            else
                view.color = [UIColor blueColor];
        }
    }
    
    for (UIView *view in self.view.subviews)
    {
        if ([view class] == [UICATileLayerView class])
            [view setNeedsDisplay];
    }
    
    [self.view setNeedsDisplay];
}

@end
