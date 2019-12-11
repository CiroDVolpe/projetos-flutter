import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transference.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'New Transference';

const _accountLabel = 'Account Number';
const _accountHint = '0000';

const _valueLabel = 'Value';
const _valueHint = '0.00';

const _buttonText = 'Confirm';

class TransferenceForm extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return TransferenceFormState();
  }
}

class TransferenceFormState extends State<TransferenceForm>{

  final TextEditingController _controllerAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _controllerAccount,
                label: _accountLabel,
                hint: _accountHint,
              ),
              Editor(
                controller: _controllerValue,
                label: _valueLabel,
                hint: _valueHint,
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_buttonText),
                onPressed: () => _createTransference(context),
              ),
            ],
          ),
        ),
    );
  }

  void _createTransference(BuildContext context){
    final int accountNumber = int.tryParse(_controllerAccount.text);
    final double value = double.tryParse(_controllerValue.text);
    if (accountNumber != null && value != null) {
      final transferenceCreated = Transference(value, accountNumber);
      Navigator.pop(context, transferenceCreated);
    }
  }
}