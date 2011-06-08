import std.stdio, std.conv;

void main(string[] args) {
  assert(fibonacci(0) == []);
  assert(fibonacci(1) == [0]);
  assert(fibonacci(3) == [0, 1, 1]);
  assert(fibonacci(21) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]);

  int number_of_elements = 10;
  if (args.length > 1) {
    number_of_elements = to!int(args[1]);
  }

  writeln(fibonacci(number_of_elements));
}

int[] fibonacci(int elements, int[] result = [])
  in {
    assert(elements >= 0);
    assert(elements < 48);
  }

int[] fibonacci_iterative(int elements) {
  if (elements == 0) {
    return [];
  body {
    if (elements == 0) {
      return result;
    }
    int new_value = result.length < 2 ? result.length : sum_tail(result);
    return fibonacci(elements - 1, result ~ new_value);
  }

  int[] result;
  result.length = elements;
  result[] = 1;
  result[0] = 0;

  foreach(i, element; result) {
    if (i <= 1) {
      continue;
    }
    result[i] = sum_tail(result);
  }
  return result;
int sum_tail(int[] from_array) {
  return from_array[$ - 2] + from_array[$ - 1];
}

