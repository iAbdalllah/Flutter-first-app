import 'package:flutter/material.dart';

class ProductCreaterecoveryPage extends StatefulWidget {
    final Function addProduct;
    ProductCreaterecoveryPage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductcreatePageState();
  }
}

class _ProductcreatePageState extends State<ProductCreaterecoveryPage> {


  String titleValue;
  String desciptionValue;
  double priceValue;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 5,
            onChanged: (String value) {
              setState(() {
                desciptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),

          RaisedButton(child: Text('create') ,onPressed: () {
            final Map<String , dynamic > product = {'title': titleValue , 'description':desciptionValue , 'price':priceValue};

            widget.addProduct(product);

          },)
        ],
      ),
    );
  }
}
