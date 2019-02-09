import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;
  ProductEditPage({this.addProduct, this.updateProduct, this.product , this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': Null,
    'description': Null,
    'price': Null,
    'image': 'assets/cafe.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      initialValue: widget.product == null ? '' : widget.product['title'],
      validator: (String value) {
        if (value.isEmpty) {
          return 'the title is requierd';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      initialValue: widget.product == null ? '' : widget.product['description'],
      maxLines: 5,
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _builPriceTextfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price'),
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (widget.product == null) {

      widget.addProduct(_formData);
      
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    }

    

    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget _pageContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTitleTextfield(),
              _buildDescriptionTextfield(),
              _builPriceTextfield(),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('save'),
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _pageContent(context);
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('edit product'),
            ),
            body: pageContent,
          );
  }
}
