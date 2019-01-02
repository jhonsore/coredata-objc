//
//  ViewController.m
//  CoredataExample
//
//  Created by Jhonnatan Soares Rebuli on 02/01/19.
//  Copyright © 2019 Coredata. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (nonatomic, strong) PersistentStack* persistentStack;
    @property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.persistentStack = [[PersistentStack alloc] initWithStoreURL:self.storeURL modelURL:self.modelURL];
    self.managedObjectContext = self.persistentStack.managedObjectContext;
    
    //adiciona item
    /*[Item
     insertItemWithkey:@"my_key_3"
     withValue:@"my-value-3"
     inManagedObjectContext:self.managedObjectContext
     ];*/
    //retorna todos os itens
    //[Item getAllItemsWithMOC: self.managedObjectContext];
    //Item *item = [Item getItemByKey:@"my_key_2" withOMC: self.managedObjectContext];
    //[Item deleteAll:self.managedObjectContext];
    //[Item removeItemWithKey:@"my_key_2" withOMC: self.managedObjectContext];
}

//------------------------------
//------------------------------
//------------------------------
- (void) addItemWithKey:(NSString *) key withValue:(NSString*) value{
    
}

- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"Model.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
}

//------------------------------
//------------------------------
//------------------------------

/*- (void)setupManagedObjectContext
{
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    NSError* error;
    [self.managedObjectContext.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:self.storeURL options:nil error:&error];
    if (error) {
        NSLog(@"error: %@", error);
    }
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
}

- (NSManagedObjectModel*)managedObjectModel
{
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
}


- (NSURL*)storeURL
{
    NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
    return [documentsDirectory URLByAppendingPathComponent:@"Model.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
}*/

//------------------------------
//------------------------------
//------------------------------

@end
