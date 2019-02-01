import 'package:flutter/material.dart';

import './ProductsPage.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error ! '),
            content: Text('Email or Password is wrong'),
            actions: <Widget>[
              FlatButton(
                child: Text("okay"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(35.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'password'),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  _passwordValue = value;
                });
              },
            ),
            SwitchListTile(
              value: _acceptTerms,
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              },
              title: Text('Accept Terms'),
            ),
            SizedBox(
              height: 40.0,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text('login'),
              onPressed: () {
                if (_emailValue == 'admin@admin.com' &&
                    _passwordValue == 'admin') {
                  return Navigator.pushReplacementNamed(context, '/products');
                } else {
                  return _showWarningDialog(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
