import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: TransferenceList(),
    );
  }
}

class TransferenceForm extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransferenceFormState();
  }
}

class TransferenceFormState extends State<TransferenceForm>{

  final TextEditingController _controller_account = TextEditingController();
  final TextEditingController _controller_value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('New Transference'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _controller_account,
                label: 'Account Number',
                hint: '0000',
              ),
              Editor(
                controller: _controller_value,
                label: 'Value',
                hint: '0.00',
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text('Confirm'),
                onPressed: () => _createTransference(context),
              ),
            ],
          ),
        )
    );
  }

  void _createTransference(BuildContext context){
    final int accountNumber = int.tryParse(_controller_account.text);
    final double value = double.tryParse(_controller_value.text);
    if (accountNumber != null && value != null) {
      final transferenceCreated = Transference(value, accountNumber);
      Navigator.pop(context, transferenceCreated);
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

}

class TransferenceList extends StatefulWidget {
  final List<Transference> _transferences = List();

  @override
  State<StatefulWidget> createState(){
    return TransferenceListState();
  }
}

class TransferenceListState extends State<TransferenceList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferences'),
      ),
      body: ListView.builder(
        itemCount: widget._transferences.length,
        itemBuilder: (context, index){
          final transference = widget._transferences[index];
          return TransferenceItem(transference);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transference> future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return TransferenceForm();
          }));
          future.then((recivedTransference){
            Future.delayed(Duration(seconds: 1), (){
              debugPrint('Chegou transferencia');
              if(recivedTransference != null) {
                setState(() {
                  widget._transferences.add(recivedTransference);
                });
               }
            });
          });
        },
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

