//
//  RequestResponseHandler.h
//  MyFirstProject
//
//  Created by Java Guru IOS on 04/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ParserResponseDelegate <NSObject>

-(void)ProcessedData:(NSMutableArray*)ResponseArray;

@end

@interface RequestResponseHandler : NSObject
{
    NSMutableData *responseData;
}
@property(nonatomic,weak)id <ParserResponseDelegate>mDelegate;

-(void)createRequestWithInformation:(NSString*)arequestString;

@end
