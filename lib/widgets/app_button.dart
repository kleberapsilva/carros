import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String login;
  Function onPressed;

  AppButton(this.login, {this.onPressed});

  @override
  Widget build(BuildContext context) {

    
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          login,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
