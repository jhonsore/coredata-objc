//
//  Item.h
//  NestedTodoList
//
//  Created by Chris Eidhof on 8/14/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString* key;
@property (nonatomic, retain) NSString* value;
@property (nonatomic, retain) NSSet* children;

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
