

// here this page is to mange the products  by 1 methods and 2 class
// my class has a array called _products and no contentes on it so we want to add contents to it 
// our first method is _addProduct and it will add one pruduct to our array and each produuct has title and image
// so now i can fill my method by product info and pass it to my array _products 
// how can i fill my first methods ? 
// by using ProductControl class which has the product info  as key and value 
// so the _addProduct method will take the infos from ProductControl class and pass it to _products array 
// then the Products class will has this infos and show it as cards and pass it to ProductPage
// to see the details of each product

import 'package:flutter/material.dart' ;

import './products.dart';
import './product_control.dart';

class ProductsManger extends StatefulWidget {

  final Map <String ,String>  startingProduct;
  ProductsManger({this.startingProduct});
    @override
  State<StatefulWidget> createState() {
    return _ProductsManger();
  }
}


class _ProductsManger extends State<ProductsManger> {

  List<Map<String ,String> >  _products = [];

  @override

  // i used initstate to check 
    void initState() {

      if (widget.startingProduct != null) {
         _products.add(widget.startingProduct);
      }
      super.initState();
    }

    // i used didUpdate to check 

    @override
      void didUpdateWidget(ProductsManger oldWidget) {
        super.didUpdateWidget(oldWidget);
      }

// this method to add product to the cards 
      void _addProduct(Map<String ,String> product) {
        setState(() {
                  _products.add(product);
                });
        print(_products);
      }

// here this method to delete the product that i'm on it by index so if i use product instaed of index it will delete every thing but index delete what i'm on it 
      void _deleteProduct (int index) {
        setState(() {
                  _products.removeAt(index);
                });
      }

  @override
    Widget build(BuildContext context) {
      return Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: ProductControl(_addProduct),
            ),
            Expanded(child:Products(_products, deleteProduct: _deleteProduct))
          ],
        );
    }


}