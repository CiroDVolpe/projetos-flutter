import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: TransferenceForm(),
      ),
    );
  }
}

class TransferenceForm extends StatelessWidget{

  final TextEditingController _controller_account = TextEditingController();
  final TextEditingController _controller_value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Transference'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            child: TextField(
              controller: _controller_account,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Account Number',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
            child: TextField(
              controller: _controller_value,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Value',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirm'),
            onPressed: () {
              final accountNumber = int.tryParse(_controller_account.text);
              final value = double.tryParse(_controller_value.text);
              if (accountNumber != null && value != null) {
                final transferenceCreated = Transference(value, accountNumber);
                debugPrint(transferenceCreated.toString());
              } else {
                print(Text('ERROR: INVALID ENTRANCE'));
              }
            },
          ),
      ],
      )
    );
  }
}

class TransferenceList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferences'),
      ),
      body: Column(
        children: <Widget>[
          TransferenceItem(Transference(100.0, 1001)),
          TransferenceItem(Transference(200.0, 1010)),
          TransferenceItem(Transference(300.0, 1100)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferenceItem extends StatelessWidget {

  final Transference _transference;

  TransferenceItem(this._transference);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transference.value.toString()),
        subtitle: Text(this._transference.accountNumber.toString()),
      ),
    );
  }
}

class Transference {
  final double value;
  final int accountNumber;

  Transference(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transference{value: $value, account: $accountNumber}';
  }
}

