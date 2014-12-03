import std.stdio;
import std.conv;
import std.getopt;

void main(string[] args) {
  int number_of_elements = -1;
  bool show_help = false;

  getopt(args, "number|elements|n|e", &number_of_elements, "help|h", &show_help);

  if (show_help || number_of_elements < 0) {
    writeln("Usage:");
    writeln();
    writeln("    " ~ args[0] ~ " <options>");
    writeln();
    writeln("    number|elements|n|e    Number of elements to include in Fibonacci sequence.  Valid values are 0 to 47.");
    writeln("    help|h                 Display this help");
    writeln();
    return;
  }

  writeln(fibonacci(number_of_elements));
}

pure int[] fibonacci(int elements, int[] result = [])
  in {
    assert(elements >= 0);
    assert(elements < 48);
  }

  body {
    if (elements == 0) {
      return result;
    }

    int new_value = result.length < 2 ? to!int(result.length) : sum_tail(result);
    return fibonacci(elements - 1, result ~ new_value);
  }


pure int sum_tail(int[] from_array) {
  return from_array[$ - 2] + from_array[$ - 1];
}

unittest {
  // assert(fibonacci(-1)  == []);
  assert(fibonacci(0)  == []);
  assert(fibonacci(1)  == [0]);
  assert(fibonacci(3)  == [0, 1, 1]);
  assert(fibonacci(21) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]);

  assert(sum_tail([4, 5, 6, 7]) == 13);
  assert(sum_tail([1, 1])       == 2);
}
