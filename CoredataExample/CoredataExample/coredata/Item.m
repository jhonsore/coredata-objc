//
//  Item.m
//  NestedTodoList
//
//  Created by Chris Eidhof on 8/14/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import "Item.h"
#import "Item.h"

@implementation Item

@dynamic key;
@dynamic value;

+ (BOOL)insertItemWithkey:(NSString*)key
                         withValue:(NSString *) value
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Item* item = [NSEntityDescription insertNewObjectForEntityForName:self.entityName
                                               inManagedObjectContext:managedObjectContext];
    item.key = key;
    item.value = value;
    NSError *error = nil;
    
    if (![managedObjectContext save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        return nil;
    }
    NSLog(@"Item saved key: %@ value:%@", key, value);
    return true;
}

+ (NSArray *) getAllItemsWithMOC:(NSManagedObjectContext *) managedObjectContext{
    NSManagedObjectContext *moc = managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:self.entityName];

    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSLog(@"%@",results);
    return results;
}

+ (Item *) getItemByKey:(NSString *) key withOMC: (NSManagedObjectContext *) managedObjectContext{
    
    NSArray *fetchedObjects;
    NSManagedObjectContext *context = managedObjectContext;
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:self.entityName
                                              inManagedObjectContext: context];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"(key == %@)",key]];
    NSError * error = nil;
    fetchedObjects = [context executeFetchRequest:fetch error:&error];
    
    NSLog(@"-- getItemByKey --");
    NSLog(@"%@",fetchedObjects);
    NSLog(@"-- end getItemByKey --");
    
    if([fetchedObjects count] == 1)
        return [fetchedObjects objectAtIndex:0];
    else
        return nil;
}

+ (void) deleteAll: (NSManagedObjectContext *) managedObjectContext{
    for (NSManagedObject *managedObject in [self getAllItemsWithMOC:managedObjectContext]) {
        [managedObjectContext deleteObject:managedObject];
    }
    
    NSError * error = nil;
    
    if (![managedObjectContext save:&error])
    {
        NSLog(@"Error ! %@", error);
    }
}

+ (BOOL) removeItemWithKey: (NSString *) key
                   withOMC: (NSManagedObjectContext *) managedObjectContext{
    Item *item = [Item getItemByKey:key withOMC: managedObjectContext];
    
    if(item){
        NSManagedObjectContext * context = managedObjectContext;
        [context deleteObject: item];
        
        NSError * error = nil;
        if (![context save:&error])
        {
            NSLog(@"Error ! %@", error);
            return nil;
        }
        return true;
    }
    NSLog(@"O item /%@/ não foi encontrado para ser removido", key);
    return nil;
}

+ (NSString*)entityName
{
    return @"Entity";
}


@end
