//
//  ViewController.m
//  MyFirstProject
//
//  Created by Java Guru IOS on 02/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import "ViewController.h"
#import "RequestResponseHandler.h"
#import "NamesView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *TabelCell;
@property (assign, nonatomic) CATransform3D initialTransformation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _myData = [[NSArray alloc]initWithObjects:
               [UIImage imageNamed:@"ATM.jpg"],
               [UIImage imageNamed:@"fuel.png"],
               [UIImage imageNamed:@"hospital.png"],
               [UIImage imageNamed:@"hotel.png"],
               [UIImage imageNamed:@"mall.jpeg"],
               [UIImage imageNamed:@"movie.png"], nil];
    _myArray = [[NSArray alloc]initWithObjects:@"atm",@"school",@"hospital",@"Hotel",@"restaurant",@"movie_theater", nil];
    
    CGFloat rotationAngleDegrees = -15;
    CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/180);
    CGPoint offsetPositioning = CGPointMake(-20, -20);
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, rotationAngleRadians, 0.0, 0.0, 1.0);
    transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, 0.0);
    _initialTransformation = transform;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *card = [(UITableViewCell* )cell contentView];
    
    card.layer.transform = self.initialTransformation;
    card.layer.opacity = 0.8;
    
    [UIView animateWithDuration:1.0 animations:^{
        card.layer.transform = CATransform3DIdentity;
        card.layer.opacity = 1;
    }];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    cell.textLabel.text = [_myArray objectAtIndex:indexPath.row];
    
    cell.imageView.image = [_myData objectAtIndex:indexPath.row];
    cell.selectionStyle = NO;
    cell.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.contentView.layer.borderWidth = 1.0f;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RequestResponseHandler *theRequestHandler =[[RequestResponseHandler alloc]init];
    theRequestHandler.mDelegate = self;
    
    [theRequestHandler createRequestWithInformation:[_myArray objectAtIndex:indexPath.row]];
}


-(void)ProcessedData:(NSMutableArray*)ResponseArray
{
    _mResponseArray = [ResponseArray mutableCopy];
    [self performSegueWithIdentifier:@"NameController" sender:nil];
    //[self performSegueWithIdentifier:@"DescriptionCell" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"NameController"]) {
        
        // Get destination view
        NamesView *vc = [segue destinationViewController];
        //DescriptionView *dc = [segue destinationViewController];
        
        // Get button tag number (or do whatever you need to do here, based on your object
        //NSInteger tagIndex = [(UIButton *)sender tag];
        
        // Pass the information to your destination view
        vc.DetailArray = _mResponseArray;
       // dc.myDict = _mResponseArray;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
