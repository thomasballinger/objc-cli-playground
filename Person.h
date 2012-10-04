#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *job;

- (Person *)initWithName:(NSString *)myName andJob:(NSString *)myJob;

@end
