import 'package:flutter_app/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = '';
  final _text = TextEditingController();
  bool _validate = false;
  TextEditingController usernameController = new TextEditingController();
  String _usernameError;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final logoSection = Container(
      child: Stack(
        children: <Widget>[
//          Container(
//            padding: EdgeInsets.fromLTRB(10.0, 110.0, 0.0, 0.0),
//            child: Text(
//              'Share Ride',
//              style: TextStyle(
//                fontSize: 20,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 105.0, 0.0, 0.0),
            child: SizedBox(
              height: 100.0,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/t1.jpg'),
                radius: 50,
              ),
            ),
          )
        ],
      ),
    );

    final emailField = TextField(
      obscureText: false,
      style: style,
      controller: usernameController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          errorText: _validate ? 'Username Can\'t Be Empty' : null,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          errorText: _validate ? 'Password Can\'t Be Empty' : null,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final forgotPassword = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );

    final loginButton = Container(
        height: 40.0,
        child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.greenAccent,
            color: Colors.green,
            elevation: 7.0,
            child: GestureDetector(
                onTap: () {
                  setState(() => this._status = 'Loading');
                  setState(() {
                    _text.text.isEmpty ? _validate = true : _validate = false;
//            validate();
                  });
                  appAuth.login().then((result) {
                    if (result) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      setState(() => this._status = 'rejected');
                    }
                  });
                },
                child: Center(
                  child: Text("LOGIN ${this._status}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ))));

    final loginWithFacebook = Container(
      height: 40.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 1.0),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ImageIcon(AssetImage('assets/ff.png')),
            ),
            SizedBox(width: 10),
            Center(
              child: Text(
                'Log in with facebook',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            )
          ],
        ),
      ),
    );
    final register = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'New to ShareRide?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5.0),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/signup');
          },
          child: Text(
            'Register',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          logoSection,
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                emailField,
                SizedBox(height: 20.0),
                passwordField,
                SizedBox(height: 5.0),
                forgotPassword,
                SizedBox(height: 30.0),
                loginButton,
                SizedBox(height: 20.0),
                loginWithFacebook
                ,SizedBox(height: 15.0)
                ,register
              ],
            ),
          ),
        ],
      ),
    );
  }

  validate() {
    if (usernameController.text != 'a1') {
      setState(() {
        _usernameError = "apple";
      });
      // show dialog/snackbar to get user attention.
      return _usernameError;
    }
    // Continue
  }
}
