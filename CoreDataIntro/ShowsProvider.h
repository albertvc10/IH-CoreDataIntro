//
//  ShowsProvider.h
//  CoreDataIntro
//
//  Created by Albert Villanueva on 28/10/14.
//  Copyright (c) 2014 Albert Villanueva. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSManagedObjectContext;
@interface ShowsProvider : NSObject

- (NSArray *)loadShowsInManagedObjectsContext:(NSManagedObjectContext *)managedObjectContext;



@end
