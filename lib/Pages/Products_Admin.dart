import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ProductsAdmin extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String , dynamic >> products ;

  ProductsAdmin(this.addProduct,this.updateProduct , this.deleteProduct , this.products);
  

  Widget _buildDrawer(BuildContext context){
    return Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Choose'),
              ),
              ListTile(
                leading: Icon(Icons.apps),
                title: Text('All Products'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          ),
        );
  }

  Widget _buildTopBar(){
    return TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.line_style),
                text: "List",
              ),
              Tab(
                icon: Icon(Icons.add_circle_outline),
                text: "create",
              )
            ],
          );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(context),
        appBar: AppBar(
          title: Text('Products Admin '),
          bottom: _buildTopBar(),
        ),
        body: TabBarView(
          children: <Widget>[ProductsListPage(products , updateProduct,deleteProduct), ProductEditPage(addProduct: addProduct)],
        ),
      ),
    );
  }
}
