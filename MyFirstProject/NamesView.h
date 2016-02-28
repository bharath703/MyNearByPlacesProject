//
//  NamesView.h
//  MyFirstProject
//
//  Created by Java Guru IOS on 09/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RequestResponseHandler.h"
@interface NamesView : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property(nonatomic,strong)NSMutableArray *DetailArray;
@property(nonatomic,strong)NSMutableArray *mResponseNameArray;
@property(nonatomic,strong)NSString *myDetailedString;
@property(nonatomic,strong)NSString *myNameString;
@property(nonatomic,strong)NSString *mylat;
@property(nonatomic,strong)NSString *mylng;
@end
