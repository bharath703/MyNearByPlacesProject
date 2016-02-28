//
//  ViewController.h
//  MyFirstProject
//
//  Created by Java Guru IOS on 02/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestResponseHandler.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ParserResponseDelegate>

@property(nonatomic,strong) NSArray *myData;
@property(nonatomic,strong) NSArray *myArray;
@property(nonatomic,strong)NSMutableArray *mResponseArray;

@end

