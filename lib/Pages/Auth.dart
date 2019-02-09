import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  final Map<String, dynamic> _loginData = {'email': null, 'password': null , 'acceptTerms' : false, };

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  Widget _buildEmailTextfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'EMAIL', filled: true),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty &&
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'the email is requierd and must be in a email syntax ';
        }
      },
      onSaved: (String value) {
        setState(() {
          _loginData['email'] = value;
        });
      },
    );
  }

  Widget _buildPassTextfield() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'PASSWORD', filled: true),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty && value.length < 8) {
          return 'the password is requierd and must be more than 8 characters long';
        }
      },
      onSaved: (String value) {
        setState(() {
          _loginData['password'] = value;
        });
      },
    );
  }

  Widget _buildSwitch() {
    return SwitchListTile(
      value: _loginData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _loginData['acceptTerms'] = value;
        });
      },
      title: Text('Agree'),
    );
  }

  void _loginButton() {
    if (!_loginKey.currentState.validate()) {
      return;
    }
    _loginKey.currentState.save();

    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _loginKey,
        child: Container(
          //padding: EdgeInsets.only(top: 100.0),
          margin: EdgeInsets.all(35.0),
          child: Center(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildEmailTextfield(),
                    SizedBox(height: 11.0),
                    _buildPassTextfield(),
                    _buildSwitch(),
                    SizedBox(
                      height: 40.0,
                    ),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      child: Text('Login'),
                      onPressed: _loginButton,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
