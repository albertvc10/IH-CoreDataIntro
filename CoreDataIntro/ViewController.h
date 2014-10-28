//
//  ViewController.h
//  CoreDataIntro
//
//  Created by Albert Villanueva on 28/10/14.
//  Copyright (c) 2014 Albert Villanueva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;




@end

