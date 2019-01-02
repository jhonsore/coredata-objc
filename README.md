# coredata-objc
Coredata Objc

Objective c Coredata example with create, edit, read, delete methods

1. Create a new project in xcode
2. Add Coredata.framework in Linked Frameworks and Libraries project
3. Copy and paste coredata folder that is inside CoredataExample > CoredataExample
4. Create a new data model in cmd+n > core data > next. Put a name that will be used and save
5. Create your entity, in attributes insert your attributes
6. In folder coredata, get the file Item and change this method with your Entity's name

+ (NSString*)entityName
{
    return @"Entity";
}

7. Customize your attributes in Item.h
8. Put your attributes in this method:

+ (BOOL)insertItemWithkey:(NSString*)key
                         withValue:(NSString *) value
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext

9. In your Controller.h insert:
#import "Item.h"
#import "PersistentStack.h"
@class PersistentStack;

10. In your Controller.m put:

@interface ViewController ()
    @property (nonatomic, strong) PersistentStack* persistentStack;
    @property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end

11. In methods (NSURL*)storeURL and (NSURL*)modelURL, change to your model name

12. Finally, use the method that u want

[Item
        insertItemWithkey:key
        withValue:value
        inManagedObjectContext:self.managedObjectContext
    ];
    
[Item getAllItemsWithMOC: self.managedObjectContext];

Item *item = [Item getItemByKey:@"my_key_2" withOMC: self.managedObjectContext];

[Item deleteAll:self.managedObjectContext];

[Item removeItemWithKey:@"my_key_2" withOMC: self.managedObjectContext];
