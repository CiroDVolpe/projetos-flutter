import 'package:flutter/material.dart';
import '../../models/receita.dart';

class Detalhes extends StatelessWidget {

  final Receita receita;

  Detalhes({Key key, @required this.receita}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _detailsBuilder();
  }

  Widget _detailsBuilder(){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _detailsImageBuilder(receita.foto),
          _detailsTitleBuilder(receita.titulo),
          _detailsIconLineBuilder('${receita.porcoes} porções', receita.tempoPreparo),
          _detailsSubtitleBuilder('Ingredientes'),
          _detailsTextBuilder(receita.ingredientes),
          _detailsSubtitleBuilder('Modo de Preparo'),
          _detailsTextBuilder(receita.modoPreparo),
        ],
      ),
      appBar: _appBarBuilder(),
    );
  }

  Widget _detailsImageBuilder(imagem){
    return Image.asset(imagem);
  }

  Widget _detailsTitleBuilder(title){
    return Center(
        child:Text(title, style: TextStyle(color: Colors.deepOrange, fontSize: 30)),
    );
  }

  Widget _detailsIconLineBuilder(rendimento, tempo_preparo){
    return Row(
      children: <Widget>[
        _detailsIconColumnBuilder(Icons.restaurant, rendimento,),
        _detailsIconColumnBuilder(Icons.timer, tempo_preparo,),
      ],
    );
  }

  Widget _detailsIconColumnBuilder(icone, texto){
    return Expanded(
        child: Column(
          children: <Widget>[
            Icon(icone, color: Colors.deepOrange,),
            Text(texto, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold,),),
          ],
        ),
    );
  }

  Widget _detailsSubtitleBuilder(subtitulo){
    return Center(
      child: Text(subtitulo, style: TextStyle(fontSize: 20,),)
      ,
    );}

  Widget _detailsTextBuilder(texto){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(texto),
    );c
  }

  Widget _appBarBuilder(){
    return AppBar(
      title: Text('Cozinha'),
    );
  }
}