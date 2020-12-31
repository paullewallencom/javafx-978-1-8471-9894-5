package module;

import java.util.Random;

public-read def size = Long.MAX_VALUE;
public var seed = Integer.MAX_VALUE;

class PrivateBar {
    function genId(): Number {
        new Random().nextInt(seed);
    }
}

public class Bar {
    def pb = PrivateBar{};
    public function print(): Void {
        println("This is a bar with id {pb.genId()}");
    }
}

class Foo {
    public function print(): Void {
        println("The foo is {size} nibblets big!");
    }
}

public function callFoo(): Void {
    Foo { }.print();
}

public function run():Void {
    print ("Nothing Else Called");
}
