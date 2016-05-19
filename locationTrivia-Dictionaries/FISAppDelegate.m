//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary*)location toLength:(NSUInteger)length{
    
    if(length > [location[@"name"] length]){
        return location[@"name"];
    }
    else{
    NSString *truncString = [location[@"name"] substringToIndex:length];
    
    return truncString;
    }
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    NSMutableDictionary *locationDict = [[NSMutableDictionary alloc] init];
    
    [locationDict setObject:name forKey:@"name"];
    //[locationDict setObject:[NSNumber numberWithFloat:latitude] forKey:@"latitude"];
    //[locationDict setObject:[NSNumber numberWithFloat:longitude] forKey:@"longitude"];
    [locationDict setObject:[NSNumber numberWithDouble:latitude] forKey:@"latitude"];     //floats have wierd rounding issues
    [locationDict setObject:[NSNumber numberWithDouble:longitude] forKey:@"longitude"];   //so use double instead
    
    return locationDict;
}

-(NSArray *)namesOfLocations:(NSArray *)locations{
    
    NSArray *namesOfLocations = [locations valueForKey:@"name"];
    
    return namesOfLocations;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    
    NSArray *checkArray = @[@"name",@"latitude",@"longitude"];
    
    if([[NSSet setWithArray:[dictionary allKeys]] isEqualToSet:[NSSet setWithArray:checkArray]]){
        return TRUE;
    }
    else{
        return FALSE;
    }
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    
    
    //NSLog(@"CHECK %@ ENDCHECK", locations);
    //NSLog(@"NAME PRINTED%@", name);
    
    for(NSUInteger counter = 0; counter < [locations count]; counter++){
        //NSUInteger locator = 0;
        if([locations[counter][@"name"] isEqualToString:name]){
            
            return locations[counter];
            //NSUInteger locator = counter;
        }

    }
    return nil;
}


@end
