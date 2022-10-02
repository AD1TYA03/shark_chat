import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/roundButton.dart';
import 'package:flash_chat/components/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth= FirebaseAuth.instance;
   String email;
   String password;
   bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ModalProgressHUD(
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
              SizedBox(
                height: 48.0,
              ),
              textField(hintText: 'Enter your email',onChanged: (value){email=value;},keyboardType: TextInputType.emailAddress,isPassword: false,),
              SizedBox(
                height: 8.0,
              ),
              textField(hintText: 'Enter your password',onChanged: (value){password=value;},isPassword: true,),
              SizedBox(
                height: 24.0,
              ),
              roundedButton(title: 'Log In', colour: Colors.lightBlueAccent, onPressed: () async{
                setState(() {
                  showSpinner=true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null)
                    Navigator.pushNamed(context, ChatScreen.id);
                  setState(() {
                    showSpinner=false;
                  });
                } catch(e){print(e);}

              }),
            ],
          ),
        ),
      ),
    );
  }
}

