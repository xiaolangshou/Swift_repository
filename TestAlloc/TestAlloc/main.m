//
//  main.m
//  TestAlloc
//
//  Created by brook.dinglan on 2020/10/22.
//

#import <Foundation/Foundation.h>
#import "TestAlloc-Swift.h"

#import "Base.h"

@interface Person : Base

@end

@implementation Person

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        id swiftPerson = [[SwiftPerson alloc] init];
        
        
        Class clz = NSClassFromString(@"SwiftPerson");
        id obj = [[clz alloc] initWithName:@""
                                       age:0];
        NSLog(@"obj: %@", obj);
    }
    
    return 0;
}
