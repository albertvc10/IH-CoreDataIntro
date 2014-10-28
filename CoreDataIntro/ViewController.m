//
//  ViewController.m
//  CoreDataIntro
//
//  Created by Albert Villanueva on 28/10/14.
//  Copyright (c) 2014 Albert Villanueva. All rights reserved.
//

#import "ViewController.h"
#import "ShowsProvider.h"
#import "ShowEntity.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayShows;
@property (nonatomic, strong) ShowsProvider *showsProvider;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.arrayShows = [self loadCachedShows];
    if (self.arrayShows.count == 0) {
        self.arrayShows = [self.showsProvider loadShowsInManagedObjectsContext:self.managedObjectContext];
    }

}

- (NSArray *)loadCachedShows {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"ShowEntity"];
    fetchRequest.predicate = [NSPredicate predicateWithValue:YES];
    NSError *error;
    NSArray *fetchResult = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return fetchResult;
}

//lazy getter
- (ShowsProvider *)showsProvider {
    
    if (!_showsProvider) {
        _showsProvider = [[ShowsProvider alloc]init];
    }
    return _showsProvider;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrayShows count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }

    ShowEntity *show = [self.arrayShows objectAtIndex:indexPath.row];
    
    cell.textLabel.text = show.showName;
    cell.detailTextLabel.text = show.showDescription;
    
    return cell;
    
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}


@end
