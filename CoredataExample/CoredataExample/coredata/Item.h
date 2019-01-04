//
//  ViewController.h
//  CoredataExample
//
//  Created by Jhonnatan Soares Rebuli on 02/01/19.
//  Copyright © 2019 Coredata. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString* key;
@property (nonatomic, retain) NSString* value;

+ (BOOL)insertItemWithkey:(NSString*)key
                         withValue:(NSString *) value
           inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
+ (NSArray *) getAllItemsWithMOC:(NSManagedObjectContext *) managedObjectContext;
+ (Item *) getItemByKey:(NSString *) key
            withOMC: (NSManagedObjectContext *) managedObjectContext;
+ (void) deleteAll: (NSManagedObjectContext *) managedObjectContext;
+ (BOOL) removeItemWithKey: (NSString *) key
                   withOMC: (NSManagedObjectContext *) managedObjectContext;
@end
