//
//  RequestResponseHandler.m
//  MyFirstProject
//
//  Created by Java Guru IOS on 04/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=12.9174948,77.5989676&radius=500&types=atm@&key=AIzaSyAkP7f_8AahpbvBzTWJWZT--M1BWw52Ae4

#import "RequestResponseHandler.h"

@implementation RequestResponseHandler

-(void)createRequestWithInformation:(NSString*)aRequestString
{
   /// key  ///AIzaSyDRsi596F7qArHZ55SpbZPcZBLrXONgkUA
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=12.9174948,77.5989676&radius=500&types=%@&key=AIzaSyDXe-2E7zWOWZJhmWx8THeX755SN6nf7N4",aRequestString];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [connection start];
}


- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Did Receive Response %@", response);
    responseData = [[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    //NSLog(@"Did Receive Data %@", data);
    [responseData appendData:data];
}
- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    NSLog(@"Did Fail");
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Did Finish");
    [self parseData:string];
    // Do something with responseData
}
#pragma mark Json Parser
-(void)parseData:(NSString*)string
{
    NSMutableArray *inputArray = [[NSMutableArray alloc]init];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:nil error:&error];
    
    NSMutableArray *response = [json valueForKey:@"results"];
    NSLog(@"count is %lu", (unsigned long)response.count);
    
    for(NSDictionary *dict in response)
    {
        NSMutableDictionary *myInternalDict = [[NSMutableDictionary alloc]init];
        
        NSDictionary *geometryDict = [dict valueForKey:@"geometry"];
        NSDictionary *locationDict = [geometryDict valueForKey:@"location"];
         [myInternalDict setValue:[locationDict valueForKey:@"lat"] forKey:@"lat"];
        [myInternalDict setValue:[locationDict valueForKey:@"lng"] forKey:@"lng"];
        
        [myInternalDict setValue:[dict valueForKey:@"name"] forKey:@"name"];
        [myInternalDict setValue:[dict valueForKey:@"vicinity"] forKey:@"vicinity"];
        [inputArray addObject:myInternalDict];
    }
    NSLog(@"the data is %@", inputArray);
    if (_mDelegate != nil)
    {
        [_mDelegate ProcessedData:inputArray];
    }
    
}



@end
