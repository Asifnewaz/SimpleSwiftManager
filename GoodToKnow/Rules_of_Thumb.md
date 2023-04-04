# Rules must know before coding

- Class name must be start with Capital letter
- Method/Function name must be start with small letter

## Function Structure (In C style):
```C
return_data_type  function_name(data_type parameterName, .....) {
  // body ...
  // ....
  // ....
}

//Example of a method name summation,
// Which will receive two parameter
// return sum

int summationOfTwoNumber(int numberOne, int numberTwo) {
  int sum = numberOne + numberTwo;
  return sum;
}


// If funtion has no return then return type will be void
// (this is not C style)
void printMyName(string name) {
  print(name);
}

```
-  One method/function always have one responsibility.
