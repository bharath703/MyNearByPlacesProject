//
//  DescriptionView.h
//  MyFirstProject
//
//  Created by Java Guru IOS on 10/12/15.
//  Copyright (c) 2015 Java Guru IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionView : UIViewController
{
    float lat,lng;
}

@property(nonatomic,strong)NSMutableArray *myDetailsArray;
@property(nonatomic,strong)NSString *mNameString;
@property(nonatomic,strong)NSString *mAddressString;
@property(nonatomic,strong)NSString *mlat;
@property(nonatomic,strong)NSString *mlng;


@end
