import 'package:flutter/material.dart';
import 'dart:convert';
import '../../models/receita.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return _homeBuilder();
  }

  Widget _homeBuilder(){
    return Scaffold(
      body: _cardListBuilder(),
      appBar: _appBarBuilder(),
    );
  }

  Widget _cardListBuilder(){
    return FutureBuilder(
      future: DefaultAssetBundle
          .of(context)
          .loadString('assets/receitas.json'),
      builder: (context, snapshot){
        List<dynamic> receitas  = json.decode(snapshot.data.toString());
        return ListView.builder(
          itemBuilder: (BuildContext context, int index){
            Receita receita = Receita.fromJson(receitas[index]);
            return _cardBuilder(receita.titulo, receita.foto);
          },
          itemCount: receitas == null ? 0 : receitas.length,
        );
      },
    );
  }

  Widget _cardBuilder(titulo, foto){
    return SizedBox(
      height: 300,
      child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _cardImageBuilder(foto),
                _cardGradientBuilder(),
                _cardTextBuilder(titulo),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardGradientBuilder(){
    return Container(
      height: 268,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _cardTextBuilder(titulo){
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(titulo, style: TextStyle(fontSize: 20, color: Colors.white),),
    );
  }
  Widget _cardImageBuilder(foto){
    return Image.asset(
      foto,
      fit: BoxFit.fill,
      height: 268,
    );
  }

  Widget _appBarBuilder(){
    return AppBar(
      title: Text('Cozinha'),
    );
  }

}