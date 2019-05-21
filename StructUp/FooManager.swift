//  Copyright © 2019 Poikile Creations. All rights reserved.

import Foundation

public struct FooManager {
    
    public static var foo: Foo = RealFoo()
    
}

public protocol Foo {
    
    func function()
    
}

public struct RealFoo: Foo {
    
    public func function() {
        print("RealFoo.function()")
    }
    
}

public struct MockFoo: Foo {
    
    public func function() {
        print("MockFoo.function()")
    }
    
}
