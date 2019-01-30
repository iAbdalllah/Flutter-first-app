import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('حذف ملعب '),
            content: Text('هل أنت متأكد من انك تريد الحذف'),
            actions: <Widget>[
              FlatButton(
                child: Text("لا"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('نعم'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
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
                child: Text(title),
              ),
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                      child: Text('حذف'),
                      onPressed:() => _showWarningDialog(context), // we use here bol value to see if the pop has true value then delete the card
                      ))
            ],
          )),
    );
  }
}
