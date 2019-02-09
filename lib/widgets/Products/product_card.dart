import 'package:flutter/material.dart';


import './Price_tag.dart';
import '../Ui_elements/title_default.dart';





class ProductCard extends StatelessWidget {

  final Map<String , dynamic > product ;

  final int productIndex ; 

  ProductCard (this.product , this.productIndex) ;

  Widget _buildRow(){
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TitleDefault(product['title']),
              SizedBox(
                width: 100.0,
              ),
              PriceTag(product['price'].toString()),
            ],
          );
  }

  Widget _buildButtonBar(BuildContext context){
    return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info_outline),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
              )
            ],
          );
  }
  
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          SizedBox(
            height: 10.0,
          ),
          _buildRow(),
          SizedBox(
            height: 10.0,
          ),
          Text(
            product['description'],
            style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),
          ),
          _buildButtonBar(context)
        ],
      ),
    );
  }
}