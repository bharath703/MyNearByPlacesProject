//
//  Customer.h
//  MyFirstProject
//
//  Created by Java Guru IOS on 03/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Customer : NSManagedObject

@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * userName;

@end
