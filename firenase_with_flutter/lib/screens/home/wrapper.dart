import 'package:firenase_with_flutter/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    // return either Home or Authenticate widget
    return SignIn();
  }
}