#import "Person.h"

@implementation Person

@synthesize name;
@synthesize job;

- (Person *)initWithName:(NSString *)myName andJob:(NSString *)myJob {
        self.name = myName;
        self.job = myJob;

        return self;
}

- (NSString *)description {
        return [NSString stringWithFormat:@"Name: %@, Job: %@", self.name, self.job];
}

@end
