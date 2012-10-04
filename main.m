#import <Foundation/Foundation.h>

#import "Person.h"

#define Log(FORMAT, ...) printf("%s", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

int main(int argc, const char *argv[])
{
        NSArray *arr = @[@"Dave", @"Alan", @"Nick", @"Sonali", @"Allison", @"Tom", @"Zach"];

        for (id name in arr) {
                Log(@"%@\n", name);
        }

        NSMutableDictionary *states = [[NSMutableDictionary alloc] init];

        states[@"NY"] = @"New York";
        states[@"CA"] = @"California";
        states[@"FL"] = @"Florida";

        for (id key in states) {
                Log(@"%@ => %@\n", key, states[key]);
        }

        Person *dave = [[Person alloc] initWithName:@"David Albert" andJob:@"Facilitator"];

        Log(@"%@\n", dave);

        return 0;
}
