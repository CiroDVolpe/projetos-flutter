import 'package:bytebank/models/transference.dart';
import 'package:bytebank/screens/tranference/form.dart';
import 'package:flutter/material.dart';

class TransferenceList extends StatefulWidget {
  final List<Transference> _transferences = List();

  @override
  State<StatefulWidget> createState(){
    return TransferenceListState();
  }
}

const _appBarText = 'Transferences';

class TransferenceListState extends State<TransferenceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarText),
      ),
      body: ListView.builder(
        itemCount: widget._transferences.length,
        itemBuilder: (context, index,){
          final transference = widget._transferences[index];
          return TransferenceItem(transference);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return TransferenceForm();
          })).then((recivedTransference){
              if(recivedTransference != null) {
                setState(() {
                  widget._transferences.add(recivedTransference);
                });
              }
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
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transference.value.toString()),
        subtitle: Text(this._transference.accountNumber.toString()),
      ),
    );
  }
}
