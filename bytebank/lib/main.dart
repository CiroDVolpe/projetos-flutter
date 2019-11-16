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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Transference'),
      ),
      body: Text('teste'),
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
}

