import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/roundButton.dart';
import 'package:flash_chat/components/textField.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.network("https://64.media.tumblr.com/cfd039730669f89c064f69e57e0877af/tumblr_inline_nvcly19vEU1r2rwhq_500.gif"),
                  ),
                ),
              ),
              Text("BLAHAJ WELCOME !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,

                ),

              ),
              SizedBox(
                height: 48.0,
              ),

              textField(
                  hintText: 'Enter your email', onChanged: (value){email=value;} , isPassword: false,keyboardType: TextInputType.emailAddress,),
              SizedBox(
                height: 8.0,
              ),
              textField(hintText: 'Enter your password', onChanged: (value){password=value;}, isPassword: true,),
              SizedBox(
                height: 24.0,
              ),
              roundedButton(title: 'Register', colour: Colors.lightBlue, onPressed: () async {
                setState(() {
                 showSpinner=true;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if(newUser!= null)
                    Navigator.pushNamed(context, ChatScreen.id);
                  setState(() {
                    showSpinner = false;
                  });
                }


                catch(e){
                  print(e);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}