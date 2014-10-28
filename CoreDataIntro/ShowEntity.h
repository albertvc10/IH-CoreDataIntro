//
//  ShowEntity.h
//  CoreDataIntro
//
//  Created by Albert Villanueva on 28/10/14.
//  Copyright (c) 2014 Albert Villanueva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ShowEntity : NSManagedObject

@property (nonatomic, retain) NSString * showId;
@property (nonatomic, retain) NSString * showName;
@property (nonatomic, retain) NSString * showDescription;

@end
