import '../controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDisplay(text: _controller.result, syntax: _controller.syntax),
          Divider(color: Colors.blue),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(
        'Calculadora',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.share),
            onPressed: () {
              Share.share("Calculadora em Flutter");
            })
      ],
      backgroundColor: Colors.blue,
      centerTitle: true,
    );
  }

  Widget _buildDisplay({String text, String syntax}) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                syntax ?? '0',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Calculator',
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                text ?? '0',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 52,
                  fontFamily: 'Calculator',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyboard() {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.65 > 500.0 ? 500 : height * 0.65,
      child: Column(
        children: [
          _buildKeyboardLine1(),
          _buildKeyboardLine2(),
          _buildKeyboardLine3(),
          _buildKeyboardLine4(),
          _buildKeyboardLine5(),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine1() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: 'AC', color: Colors.blue),
          _buildButton(label: 'DEL', color: Colors.blue),
          _buildButton(label: '%', color: Colors.blue),
          _buildButton(label: '/', color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine2() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '7'),
          _buildButton(label: '8'),
          _buildButton(label: '9'),
          _buildButton(label: 'x', color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine3() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '4'),
          _buildButton(label: '5'),
          _buildButton(label: '6'),
          _buildButton(label: '-', color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine4() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '1'),
          _buildButton(label: '2'),
          _buildButton(label: '3'),
          _buildButton(label: '+', color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine5() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '0', flex: 2),
          _buildButton(label: ','),
          _buildButton(label: '=', color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildButton(
      {String label, int flex = 1, Color color = Colors.black}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            color: color,
          ),
        ),
        color: Colors.white,
        onPressed: () => _calculadoraLogic(label),
      ),
    );
  }

  _calculadoraLogic(String label) {
    setState(() {
      _controller.applyCommand(label);
    });
  }
}
