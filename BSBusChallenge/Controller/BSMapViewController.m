//
//  BSMapViewController.m
//  BSBusChallenge
//
//  Created by Mick Lerche on 3/24/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "BSMapViewController.h"
#import "BSBusStop.h"
#import "BSDetailViewController.h"
#import "BSBusStopPointAnnotation.h"

@interface BSMapViewController () <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *busStopMapView;
@property CLLocationManager *locationManager;
@property BSBusStop *detailBusStop;

@end

@implementation BSMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self centerMap];
    for (BSBusStop *bsBusStop in self.bsBusStops) {
        BSBusStopPointAnnotation *annotation = [BSBusStopPointAnnotation new];
        annotation.coordinate = CLLocationCoordinate2DMake([bsBusStop.latitude doubleValue], [bsBusStop.longitude doubleValue]);
        annotation.title = bsBusStop.ctaStopName;
        annotation.subtitle = bsBusStop.routes;
        annotation.isMetra = bsBusStop.isMetra;
        annotation.arrayIndex = bsBusStop.arrayIndex;
        [self.busStopMapView addAnnotation:annotation];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isEqual:mapView.userLocation]) {
        return nil;
    } else {
        MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pin.pinColor = ((BSBusStopPointAnnotation *)annotation).isMetra ? MKPinAnnotationColorPurple : MKPinAnnotationColorGreen;
        pin.animatesDrop = NO;
        pin.tag = ((BSBusStopPointAnnotation *)annotation).arrayIndex;
        return pin;
    }
}

- (void)centerMap {
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake([((BSBusStop *)[self.bsBusStops objectAtIndex:0]).latitude doubleValue],
                                                                         [((BSBusStop *)[self.bsBusStops objectAtIndex:0]).longitude doubleValue]);

    MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, coordinateSpan);
    [self.busStopMapView setRegion:region animated:YES];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
//    BSDetailViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"BSDetailViewController"];
//    detailController.bsBusStop = [self.bsBusStops objectAtIndex:view.tag];
//    [self.navigationController pushViewController: detailController animated:YES];

    self.detailBusStop = [self.bsBusStops objectAtIndex:view.tag];
    [self performSegueWithIdentifier:@"DetailSegue" sender:self];
}

- (void)displayUserLocation {
    self.locationManager = [CLLocationManager new];
    [self.locationManager requestWhenInUseAuthorization];
    self.busStopMapView.showsUserLocation = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BSDetailViewController *detailController = segue.destinationViewController;
    detailController.bsBusStop = self.detailBusStop;
    detailController.title = self.detailBusStop.ctaStopName;

}

















@end
