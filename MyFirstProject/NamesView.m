//
//  NamesView.m
//  MyFirstProject
//
//  Created by Java Guru IOS on 09/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import "NamesView.h"
#import "RequestResponseHandler.h"
#import "DescriptionView.h"
@interface NamesView ()

@end

@implementation NamesView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"the array is %@", _DetailArray);
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _DetailArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell"];
    cell.textLabel.text = [[_DetailArray objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.layer.borderWidth = 1.0f;
    cell.contentView.layer.backgroundColor = [UIColor orangeColor].CGColor;
    cell.textLabel.backgroundColor = [UIColor orangeColor];
    cell.selectionStyle = NO;
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    RequestResponseHandler *theRequestHandler =[[RequestResponseHandler alloc]init];
//    theRequestHandler.mDelegate = self;
//    [theRequestHandler createRequestWithInformation:[_DetailArray objectAtIndex:indexPath.row]];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _myDetailedString = [[_DetailArray objectAtIndex:indexPath.row] valueForKey:@"vicinity"];
    _myNameString = [[_DetailArray objectAtIndex:indexPath.row] valueForKey:@"name"];
    _mylat = [[_DetailArray objectAtIndex:indexPath.row] valueForKey:@"lat"];
    _mylng = [[_DetailArray objectAtIndex:indexPath.row] valueForKey:@"lng"];
    [self performSegueWithIdentifier:@"DescriptionCell" sender:nil];
}


//-(void)ProcessedData:(NSMutableArray*)ResponseArray
//{
//    _mResponseNameArray = [ResponseArray mutableCopy];
//    [self performSegueWithIdentifier:@"DescriptionCell" sender:nil];
//    //[self performSegueWithIdentifier:@"DescriptionCell" sender:nil];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"DescriptionCell"]) {
        
        
        DescriptionView *vc = (DescriptionView *)[segue destinationViewController];
        
        vc.mNameString = _myNameString;
        vc.mAddressString = _myDetailedString;
        vc.mlat = _mylat;
        vc.mlng = _mylng;
        
    }
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
