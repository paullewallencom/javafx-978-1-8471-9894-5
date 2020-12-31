package module;

class myclass {
    function doSomething():Void{}
}

println ("FooBar seed = {FooBarModule.seed}");
println ("FooBar size = {FooBarModule.size}");


FooBarModule.seed = 200000;

def bar = FooBarModule.Bar{};
bar.print();
FooBarModule.callFoo();
