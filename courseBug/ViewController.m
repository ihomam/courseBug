//
//  ViewController.m
//  courseBug
//
//  Created by Homam on 31/03/16.
//  Copyright © 2016 isoft-land. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
@property (nonatomic,strong) CLLocationManager* manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.manager = [CLLocationManager new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
    [self.manager requestAlwaysAuthorization];
    ((GMSMapView *)self.view).myLocationEnabled = YES;
    ((GMSMapView *)self.view).settings.myLocationButton = YES;
    
    [self addObserver:self
           forKeyPath:@"self.view.myLocation"
              options:NSKeyValueObservingOptionNew
              context:Nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    CLLocation *location = change[@"new"];
    // sometimes the value is -1
    // and when it changes to something like 150
    // it stucks there till sometime
    // then it stucks in another value
    NSLog(@"course value is:%f",location.course);
}
@end
