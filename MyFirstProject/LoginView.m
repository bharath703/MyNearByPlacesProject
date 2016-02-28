//
//  LoginView.m
//  MyFirstProject
//
//  Created by Java Guru IOS on 03/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import "LoginView.h"
#import "AppDelegate.h"
#import "Customer.h"
#import "ViewController.h"
@interface LoginView ()
{
    AppDelegate *mAppDelegate;
}
@end

@implementation LoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mAppDelegate =(AppDelegate*)[UIApplication sharedApplication].delegate;

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
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

- (IBAction)mNewSignUpAction:(id)sender {
    Customer *myCustomerEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:mAppDelegate.managedObjectContext];
    //****
    //You should CONTINUE from here.
    //****
    myCustomerEntity.userName = _mNewUserName.text;
    myCustomerEntity.password = _mNewPassword.text;
    
    [mAppDelegate saveContext];

}

/*else
 {
 if (j==array.count)
 {
 
 }
 
 }
*/

- (IBAction)mLoginButtonAction:(id)sender {
    BOOL Validation = NO;
    NSManagedObjectContext *moc = [mAppDelegate managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Customer" inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
        NSError *error;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    for ( int j=0; j<array.count; j++) {
        
        Customer *myCustomer =[array objectAtIndex:j];
        
        if ([myCustomer.userName isEqualToString:_myUserName.text] && [myCustomer.password isEqualToString:_myPassword.text])
        {
            Validation = YES;
            
                UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ViewController *ListViewController = (ViewController *)[sb instantiateViewControllerWithIdentifier:@"ListVIewController"];
                [self.navigationController pushViewController:ListViewController animated:YES];
                
                NSLog(@"User name and password mathes");
                break;
            
        }
        
    }
    if (!Validation) {
        NSLog(@"Invalid User name and password");
 UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error..!"message:@"Invalid User name and password"delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert show];
        
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        ViewController *ListViewController = (ViewController *)[sb instantiateViewControllerWithIdentifier:@"ListVIewController"];
//        [self.navigationController pushViewController:ListViewController animated:YES];
//
    }
    

    
    for (int i=0; i<array.count; i++) {
        
        Customer *myCustomer =[array objectAtIndex:i];
        
       
        NSLog(@"name is %@", myCustomer.userName);
        NSLog(@"name is %@", myCustomer.password);
        
    }
    
    
    if (array == nil)
    {
        // Deal with error...
    }

}
@end
