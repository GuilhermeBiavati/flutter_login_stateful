import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            // Container(
            //   margin: EdgeInsets.only(top: 25.0),
            // ),
            submitField(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (String? value) {
        email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password', hintText: 'Password'),
      validator: validatePassword,
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget submitField() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: submitButt,
      child: Text('Submit'),
    );
  }

  submitButt() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print('Time to post $email and $password to my API');
    }
  }
}
