import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String d2 = 'Data not Stored';
  String d1 = 'Data Stored';
  String check = '';
  //TODO Connectivity Status Function
  void checkConnection() async {
    var result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.none) {
      setState(() {
        check = d2;
      });
      Fluttertoast.showToast(
          msg: "Network Connection Error",
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        check = d1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 30.0),
        //TODO Image Part
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 130.0),
          child: Column(
            children: [
              Image(
                height: 100.0,
                image: AssetImage('assets/logo.png'),
              ),
              SizedBox(height: 10.0),
              Text(
                'User Login',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        //TODO Text Fields Part
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              TextField(
                // onChanged: (text) {},
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  //   // borderSide: BorderSide(color: Colors.black, width: 2.0),
                  // ),
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'Username or Email',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                // onChanged: (text) {},
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  //   // borderSide: BorderSide(color: Colors.black, width: 2.0),
                  // ),
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        //TODO Data Stored Message Display
        Center(
          child: Text(check.toString()),
        ),
        SizedBox(height: 20.0),
        //TODO Login Button Part
        Center(
          child: Container(
            width: 120.0,
            height: 50.0,
            decoration: BoxDecoration(
              // Border
              borderRadius: BorderRadius.circular(20.0),
              // Gradient
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[500], Colors.green[400]],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => checkConnection(),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        //TODO Forgot Password
        Text(
          'Forgot Password ?',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 30.0,
        ),
        //TODO Divider Part
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Divider(
            color: Colors.black45,
            thickness: 1.0,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        //TODO Sign in Text Part
        Center(
            child: Text(
          'or Sign in',
          style: TextStyle(color: Colors.white),
        )),
        SizedBox(
          height: 20.0,
        ),
        //TODO Icon Part
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SignInButton(
              Buttons.Facebook,
              mini: true,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Twitter,
              mini: true,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.LinkedIn,
              mini: true,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Tumblr,
              mini: true,
              onPressed: () {},
            ),
            SignInButton(
              Buttons.GitHub,
              mini: true,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
