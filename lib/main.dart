import 'package:flutter/material.dart';

import './Pages/Auth.dart';
import './Pages/Products_Admin.dart';
import './Pages/ProductsPage.dart';
import './Pages/Product.dart';

// here you build the main function that run your app by using the calss that you made with the widget that you need
// you can use this syntax to make a function void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Myapp();
  }
}

class _Myapp extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  // this method to add product to the cards
  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  void _updateProduct(int index , Map<String , dynamic > product) {

    _products[index] = product ;

  }

// here this method to delete the product that i'm on it by index so if i use product instaed of index it will delete every thing but index delete what i'm on it
  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent),
          
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            ProductsAdmin(_addProduct, _updateProduct ,_deleteProduct, _products),
      },

      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image'] , _products[index]['price'],_products[index]['description']),
          );
        }

        return null;
      },

      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
    );
  }
}
