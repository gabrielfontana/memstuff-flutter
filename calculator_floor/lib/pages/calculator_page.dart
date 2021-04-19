import '../controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import '../core/constants.dart';

import '../widgets/number_input_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/text_header.dart';
import 'result_dialog.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHeader(label: kEnvironmentHeader, opacity: kOpacityHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setRoomWitdh,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLength ($kMeters)',
            onSaved: _controller.setRoomLength,
          ),
          SizedBox(height: kBigSpace),
          TextHeader(label: kFloorHeader, opacity: kOpacityHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setFloorWitdh,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLength ($kMeters)',
            onSaved: _controller.setFloorLength,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kPrice ($kSquareMeter)',
            onSaved: _controller.setFloorPrice,
          ),
          SizedBox(height: kBigSpace),
          PrimaryButton(
            label: kClean,
            onPressed: _onCalculate,
          ),
          SizedBox(height: kSpace),
          PrimaryButton(
            label: kCalculateButton,
            onPressed: _onCalculate,
          ),
        ],
      ),
    );
  }

  void _onCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      ResultDialog.show(context, result);
    }
  }
}
