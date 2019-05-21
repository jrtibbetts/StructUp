//  Copyright © 2019 Poikile Creations. All rights reserved.

import Foundation

public struct StructManager {
    
    public static var destruction: Destruction = Destruction1()
    
}

public protocol Destruction {
    
    func function()
    
}

public struct Destruction1: Destruction {
    
    public init() { }
    
    public func function() {
        print("Destruction1.function()")
    }
    
}

public struct Destruction2: Destruction {
    
    public init() { }
    
    public func function() {
        print("Destruction2.function()")
    }
    
}
