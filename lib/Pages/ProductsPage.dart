import 'package:flutter/material.dart';


import '../widgets/Products/products.dart';


class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductsPage(this.products);


  Widget _buildDraweer(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text('Mange Products'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/admin');
              },
            )
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDraweer(context),
      appBar: AppBar(
        title: Text('Abdullah App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_center_focus),
            onPressed: () {},
          )
        ],
      ),
      body: Products(products),
    );
  }
}
