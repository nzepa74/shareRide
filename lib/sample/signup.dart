import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignupState();
}

class _SignupState extends State<SignupPage> {
  String _status = 'no-action';
  final _text = TextEditingController();
  bool _validate = false;
  TextEditingController usernameController = new TextEditingController();
  String _usernameError;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final nameField = TextField(
      obscureText: false,
      style: style,
      controller: usernameController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          errorText: _validate ? 'Name Can\'t Be Empty' : null,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final addressField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Address",
          errorText: _validate ? 'Address Can\'t Be Empty' : null,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                nameField,
                SizedBox(height: 20.0),
                addressField,
                SizedBox(height: 5.0),
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
