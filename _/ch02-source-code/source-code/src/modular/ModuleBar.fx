
package modular;
package class Foo {
	public-init var fooValue = 0;
	function print():Void {
		println("This is a foo");
	}
}

public class Bar {
	public function print() : Void{
		println("This is a bar");
	}
}

protected function makeAFoo():Foo {
	Foo{};
}

public function makeABar():Bar {
	Bar{};
}

public-read def value = 12;

