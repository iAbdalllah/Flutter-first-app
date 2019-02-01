import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ProductsAdmin extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductsAdmin(this.addProduct,this.deleteProduct);
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('All Products'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Products Admin '),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.filter_list),
                text: "List",
              ),
              Tab(
                icon: Icon(Icons.add_circle_outline),
                text: "create",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ProductsListPage(), ProductCreatePage(addProduct)],
        ),
      ),
    );
  }
}
