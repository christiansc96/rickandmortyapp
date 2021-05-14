import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rickandmortyapp/home/screens/ui/home.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100.0),
                    Center(
                      child: Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    _buildFieldUser(),
                    SizedBox(height: 30.0),
                    _buildFieldPassword(),
                    SizedBox(height: 15.0),
                    _buildButtonLogIn(context),
                    SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldUser() {
    return TextFormField(
        controller: userController,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
            20.0,
            15.0,
            20.0,
            15.0,
          ),
          hintText: "Usuario",
          hoverColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              32.0,
            ),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'El campo es requerido';
          }
          return null;
        });
  }

  Widget _buildFieldPassword() {
    return TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
            20.0,
            15.0,
            20.0,
            15.0,
          ),
          hintText: "Contraseña",
          hoverColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              32.0,
            ),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'El campo es requerido';
          }
          return null;
        });
  }

  Widget _buildButtonLogIn(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(
        30.0,
      ),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(
          20.0,
          15.0,
          20.0,
          15.0,
        ),
        onPressed: () async {
          if (loginFormKey.currentState.validate()) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHome()),
                (Route<dynamic> route) => false);
          }
        },
        child: Text(
          "Entrar",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
