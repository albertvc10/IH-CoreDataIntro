//
//  ShowsProvider.m
//  CoreDataIntro
//
//  Created by Albert Villanueva on 28/10/14.
//  Copyright (c) 2014 Albert Villanueva. All rights reserved.
//

#import "ShowsProvider.h"
#import "ShowEntity.h"


@implementation ShowsProvider


- (NSArray *)loadShowsInManagedObjectsContext:(NSManagedObjectContext *)managedObjectContext{
    
    
    NSError *error;
    NSString *filePath = [[NSString alloc] init];
    
    filePath = [[NSBundle mainBundle] pathForResource:@"shows" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    NSMutableArray *arrayShows = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in [JSONDictionary valueForKey:@"shows"]) {
        ShowEntity *show = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([ShowEntity class]) inManagedObjectContext:managedObjectContext];
        
        show.showId = [dictionary valueForKey:@"id"];
        show.showName = [dictionary valueForKey:@"title"];
        show.showDescription = [dictionary valueForKey:@"description"];

        [arrayShows addObject:show];
    }
    
    [managedObjectContext save:&error];
    
    return arrayShows;
}

@end
