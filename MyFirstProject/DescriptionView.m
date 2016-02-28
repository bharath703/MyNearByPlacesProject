//
//  DescriptionView.m
//  MyFirstProject
//
//  Created by Java Guru IOS on 10/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import "DescriptionView.h"
#import <MapKit/MapKit.h>
@interface DescriptionView ()
{
    CLLocationCoordinate2D myCoordinate;
}


@property (weak, nonatomic) IBOutlet UILabel *mTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *mAddressLabel;
@property (weak, nonatomic) IBOutlet MKMapView *myMap;

@end

@implementation DescriptionView

- (void)viewDidLoad {
    [super viewDidLoad];
    _mTitleLabel.text = _mNameString;
    _mAddressLabel.text = _mAddressString;
    lat = [_mlat floatValue];
    lng = [_mlng floatValue];
    MKCoordinateRegion myregion;
    myCoordinate.latitude = lat;
    myCoordinate.longitude = lng;
    MKCoordinateSpan mySpan;
    mySpan.latitudeDelta=0.0050f;
    mySpan.longitudeDelta=0.0050f;
    myregion.center = myCoordinate;
    myregion.span=mySpan;
    
    CLLocationCoordinate2D annotationCoord;
    
    annotationCoord.latitude = lat;
    annotationCoord.longitude = lng;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = _mNameString;
    annotationPoint.subtitle = _mAddressString;
    [_myMap addAnnotation:annotationPoint];
    [_myMap setRegion:myregion animated:YES];

    // Do any additional setup after loading the view.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
