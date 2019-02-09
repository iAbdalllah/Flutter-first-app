import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/Products/Price_tag.dart';
import '../widgets/Ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  ProductPage(this.title, this.imageUrl, this.price, this.description);

  // _showWarningDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('حذف ملعب '),
  //           content: Text('هل أنت متأكد من انك تريد الحذف'),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text("لا"),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('نعم'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 Navigator.pop(context, true);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  Widget _buildRow(){
    return Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(25.0),
                  child: Text(description,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ]);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false); //we use flase value to make the not crash
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(title) ,
              ),
              _buildRow(),
              PriceTag(price.toString()),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                child: Text('chose this product'),
                onPressed: () {},
              )
            ],
          )),
    );
  }
}
