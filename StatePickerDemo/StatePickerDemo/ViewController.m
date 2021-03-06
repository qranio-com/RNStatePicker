//
//  ViewController.m
//  StatePickerDemo
//
//  Created by Dmitry Shmidt on 26/11/13.
//  Copyright (c) 2013 Dmitry Shmidt. All rights reserved.
//

#import "ViewController.h"
#import "RNStatePickerViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *countryImageView;
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryCodeLabel;
@property (weak, nonatomic) IBOutlet UITextField *tfSearch;
@end

@implementation ViewController

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
- (IBAction)chooseCountry:(id)sender {
    
    RNStatePickerViewController *vc = [[RNStatePickerViewController alloc]init];
    vc.completionBlock = ^(id<RNState> state) {
        _countryNameLabel.text = state.stateName;
        _countryImageView.image = state.stateImage;
        _countryCodeLabel.text = state.stateCode;

    };
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)search:(id)sender {
    RNState *state = [RNState stateWithCode:self.tfSearch.text inCountry:@"BR"];
    if (state) {
        _countryNameLabel.text = state.stateName;
        _countryImageView.image = state.stateImage;
        _countryCodeLabel.text = state.stateCode;
    }
}
@end
