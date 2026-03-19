class Calculator {
  double _result = 0;
  double _lastNumber = 0;
  String _lastOperation = "Clear";
  double _previousResult = 0;

  // Getter احترافي للنتيجة النهائية (Read-only)
  double get finalResult => _result;

  bool _isZero(double number) => number == 0;

  // ميزة Method Chaining: لاحظ أننا نعيد (this) في كل عملية
  Calculator add(double number) {
    _lastNumber = number;
    _previousResult = _result;
    _lastOperation = "Adding";
    _result += number;
    return this;
  }

  Calculator subtract(double number) {
    _lastNumber = number;
    _previousResult = _result;
    _lastOperation = "Subtracting";
    _result -= number;
    return this;
  }

  Calculator multiply(double number) {
    _lastNumber = number;
    _previousResult = _result;
    _lastOperation = "Multiplying";
    _result *= number;
    return this;
  }

  Calculator divide(double number) {
    if (_isZero(number)) {
      print("Warning: Division by zero! Using 1 instead.");
      number = 1;
    }
    _lastNumber = number;
    _previousResult = _result;
    _lastOperation = "Dividing";
    _result /= number;
    return this;
  }

  Calculator cancelLastOperation() {
    _lastOperation = "Cancelling Last Operation";
    _result = _previousResult;
    _lastNumber = 0;
    return this;
  }

  Calculator clear() {
    _result = 0;
    _lastNumber = 0;
    _previousResult = 0;
    _lastOperation = "Clear";
    return this;
  }

  void printResult() {
    print("Result After $_lastOperation $_lastNumber is: $_result");
  }
}

void main() {
  Calculator().clear().add(10).printResult();

  var myCalc = Calculator();
  myCalc.add(100).subtract(20).divide(0).multiply(3).printResult();

  myCalc.cancelLastOperation().printResult();
}
