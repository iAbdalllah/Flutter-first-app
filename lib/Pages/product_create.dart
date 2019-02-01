import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductcreatePageState();
  }
}

class _ProductcreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _desciptionValue;
  double _priceValue;

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
                _titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 5,
            onChanged: (String value) {
              setState(() {
                _desciptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('create'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _desciptionValue,
                'price': _priceValue,
                'image': 'assets/cafe.jpg'
              };

              widget.addProduct(product);

              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }
}
