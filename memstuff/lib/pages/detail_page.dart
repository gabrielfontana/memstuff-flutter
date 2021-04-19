import 'package:flutter/material.dart';
import 'package:memstuff/controllers/detail_controller.dart';
import 'package:memstuff/core/app_const.dart';
import 'package:memstuff/repositories/mock_stuff_repository_impl.dart';
import 'package:memstuff/widgets/date_input_field.dart';
import 'package:memstuff/widgets/loading_dialog.dart';
import 'package:memstuff/widgets/photo_field_area.dart';
import 'package:memstuff/widgets/primary_button.dart';
import 'package:memstuff/widgets/text_input_field.dart';
import '../models/stuff_model.dart';

class DetailPage extends StatefulWidget {
  final StuffModel stuff;

  const DetailPage({
    Key key,
    this.stuff,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = DetailController(MockStuffRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stuff == null ? kTitleNewLoan : kTitleDetails),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: _buildForm(),
      ),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PhotoInputArea(
            initialValue: widget.stuff?.photoPath ?? '',
            onChanged: _controller.setPhoto,
          ),
          TextInputField(
            label: kLabelDescription,
            icon: Icons.description_outlined,
            initialValue: widget.stuff?.description ?? '',
            onSaved: _controller.setDescription,
          ),
          TextInputField(
            label: kLabelName,
            icon: Icons.person_outlined,
            initialValue: widget.stuff?.contactName ?? '',
            onSaved: _controller.setName,
          ),
          DateInputField(
            label: kLabelLoanDate,
            initialValue: widget.stuff?.date ?? '',
            onSaved: _controller.setDate,
          ),
          PrimaryButton(
            label: kButtonSave,
            onPressed: _onSave,
          ),
        ],
      ),
    );
  }

  Future _onSave() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      LoadingDialog.show(
        context,
        message: widget.stuff == null ? 'Salvando...' : 'Atualizando...',
      );
      final result = await _controller.save();
      LoadingDialog.hide();
      Navigator.of(context).pop(result);
    }
  }
}
