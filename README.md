# StructUp
Demonstrates a Swift compiler error (bug?) where static properties from one module can't be changed in a UI testing module

I have a protocol in my main target that I'm calling `Foo`:

```
public protocol Foo {
    func function()
}
```

I want two implementations of `Foo` (say, one for regular use, and one for testing):

```
public struct RealFoo: Foo { 
    public init() { }
    
    public func function() {
        print("RealFoo.function()")
    }
}

public struct MockFoo: Foo {
    public init() { }
    
    public func function() {
        print("MockFoo.function()")
    }
}
```

There should be only one instance of a `Foo` in the lifetime of my app, but instead of creating a *global* variable for it, I have a `FooManager` with a static property for the `Foo` instance:

```
public struct FooManager {    
    public static var foo: Foo = RealFoo()   
}
```

So far, so good. In my main target, I set it to use the `RealFoo`:

```
FooManager.foo = RealFoo()
```

In the unit test target, it's the mock one:

```
    override func setUp() {
        FooManager.foo = MockFoo()
    }
```

**HOWEVER**, in the UI test target, all hell breaks loose:

```
Undefined symbols for architecture x86_64:
  "StructUp.MockFoo.init() -> StructUp.MockFoo", referenced from:
      StructUpUITests.StructUpUITests.setUp() -> () in StructUpUITests.o
  "StructUp.FooManager.foo.unsafeMutableAddressor : StructUp.Foo", referenced from:
      StructUpUITests.StructUpUITests.setUp() -> () in StructUpUITests.o
  "type metadata for StructUp.MockFoo", referenced from:
      StructUpUITests.StructUpUITests.setUp() -> () in StructUpUITests.o
  "protocol witness table for StructUp.MockFoo : StructUp.Foo in StructUp", referenced from:
      StructUpUITests.StructUpUITests.setUp() -> () in StructUpUITests.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

Googling `"protocol witness table for"` doesn't yield much beyond updating the framework search paths. Why would this work in _unit_ tests, but not _UI_ tests?

I've tried a number of different things:
* Changing `RealFoo` and `MockFoo` to classes makes no difference.
* Changing `FooManager` to a class adds an additional `Undefined symbol: type metadata accessor for StructUp.FooManager`.
* Taking `foo` out of the `FooManager` and making it a global variable makes no difference.

