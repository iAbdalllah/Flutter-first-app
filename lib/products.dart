import 'package:flutter/material.dart';

import './Pages/Product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct; // for delete purpuse 
  Products(this.products , {this.deleteProduct}) {
    print('Products widget constructor');
  }

  Widget _buildProductItem(context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push<bool>(  // <bool> for delete button
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductPage(
                            products[index]['title'], products[index]['image']),
                      ),

                      //  for delete purpuse
                    ).then((bool value){ 

                      if (value == true)  {
                        deleteProduct (index);
                      }

                      // end of delete purpuse 

                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Products widget build');
    Widget productCard = Center(
      child: Text('عفوا لا يوجد ملاعب مسجلة لدينا  '),
    );
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCard;
  }
}
