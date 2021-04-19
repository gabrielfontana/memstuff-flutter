class CalculatorController {
  static const kZero = '0';
  static const kMemoryFirst = 0;
  static const kMemoryClear = [0.0, 0.0];
  static const kOperationNull = null;
  static const kPoint = ',';
  static const kEmpty = '';
  static const kOperations = ['+', '-', 'x', '/', '%', '='];

  static final kPlus = kOperations[0];
  static final kMinus = kOperations[1];
  static final kTimes = kOperations[2];
  static final kDivision = kOperations[3];
  static final kPercentage = kOperations[4];

  List<double> _memories = [0.0, 0.0];
  int _currentMemoryIndex = 0;
  String _operation;
  bool _usedOperation;
  bool _usedEqual;
  String syntax;
  String result;

  CalculatorController() {
    _clear();
  }

  void _clear() {
    syntax = kEmpty;
    result = kZero;
    _memories.setAll(kMemoryFirst, kMemoryClear);
    _currentMemoryIndex = kMemoryFirst;
    _operation = kOperationNull;
    _usedOperation = false;
    _usedEqual = false;
  }

  void _deleteDigit() {
    if (result.length > 1) {
      result = result.substring(0, result.length - 1);
    } else {
      result = kZero;
    }

    if (!syntax.endsWith(kPlus) &&
        !syntax.endsWith(kMinus) &&
        !syntax.endsWith(kTimes) &&
        !syntax.endsWith(kDivision) &&
        !syntax.endsWith(kPercentage)) {
      if (syntax.length > 1) {
        syntax = syntax.substring(0, syntax.length - 1);
      } else {
        syntax = kEmpty;
      }
    }

    _memories[_currentMemoryIndex] = double.parse(
      result.replaceAll(kPoint, '.'),
    );
  }

  void _addDigit(String digit) {
    if (_usedOperation) result = kZero;
    if (result == kZero && digit != kPoint) result = kEmpty;
    if (result.contains(kPoint) && digit == kPoint) digit = kEmpty;

    syntax += digit;
    result += digit;
    print(_memories);

    _memories[_currentMemoryIndex] = double.parse(
      result.replaceAll(kPoint, '.'),
    );
    _usedOperation = false;
  }

  void _setOperation(String operation) {
    if (_usedOperation && _operation == operation) return;

    if (_currentMemoryIndex == kMemoryFirst) {
      _currentMemoryIndex++;
    } else if (!_usedEqual || (_usedEqual && operation == '=')) {
      _memories[kMemoryFirst] = _calculate();
    }

    if (operation != '=') {
      _operation = operation;
      _usedEqual = false;
    } else {
      _usedEqual = true;
    }

    _outputFormat();
    _usedOperation = true;
  }

  void _outputFormat() {
    result = _memories[kMemoryFirst].toString();
    result = result.endsWith('.0') ? result.replaceAll('.0', '') : result;
    result = result.replaceAll('.', kPoint);
  }

  double _calculate() {
    if (_operation == '+') return _memories[0] + _memories[1];
    if (_operation == '-') return _memories[0] - _memories[1];
    if (_operation == 'x') return _memories[0] * _memories[1];
    if (_operation == '/') return _memories[0] / _memories[1];
    if (_operation == '%') return _memories[0] % _memories[1];
    return 0.0;
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      _clear();
    } else if (command == 'DEL') {
      _deleteDigit();
    } else if (kOperations.contains(command)) {
      _setOperation(command);
      syntax = result;
      if (command != '=') syntax += command;
      print(_memories);
    } else {
      _addDigit(command);
    }
  }
}
