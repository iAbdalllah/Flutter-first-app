import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  @override

  Function addProduct;

  ProductControl(this.addProduct);


  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: (){
        addProduct({'title': 'ملعب' ,'image': 'assets/cafe.jpg'});
      },
      child: Text('اضافة ملعب'),
    );
  }
}
