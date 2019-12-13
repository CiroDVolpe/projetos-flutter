import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _homeBuilder();
  }

  Widget _homeBuilder(){
    return Scaffold(
      body: _cardBuilder(),
      appBar: _appBarBuilder(),
    );


  }

  Widget _cardBuilder(){
    return SizedBox(
      height: 300,
      child: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                _cardImageBuilder(),
                _cardTextBuilder(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardTextBuilder(){
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text('Bolo de Chocolate', style: TextStyle(fontSize: 20),),
    );
  }
  Widget _cardImageBuilder(){
    return Image.network(
      'https://www.oetker.com.br/Recipe/Recipes/oetker.com.br/br-pt/baking/image-thumb__67767__RecipeDetail/bolo-trufado-de-chocolate-com-avela.jpg',
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