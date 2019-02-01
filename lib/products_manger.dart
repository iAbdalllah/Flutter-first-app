

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

class ProductsManger extends StatelessWidget {

  final List <Map<String , dynamic>> products;

  ProductsManger(this.products ) ;

  @override
    Widget build(BuildContext context) {
      return Column(
          children: [
      
            Expanded(child:Products(products))
          ],
        );
    }


}