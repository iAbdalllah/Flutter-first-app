import 'package:flutter/material.dart';

import '../products_manger.dart';
import './Products_Admin.dart';

class ProductsPage extends StatelessWidget {

  final List <Map<String , dynamic >> products;

  ProductsPage(this.products );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Choose'),
            ),
            ListTile(title: Text('Mange Products'),onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/admin');
              
            },)
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Abdullah App'),
      ),
      body: ProductsManger(products),
    );
  }
}
