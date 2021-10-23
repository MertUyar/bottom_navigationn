import 'package:flutter/material.dart';

import 'main_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _secureText = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  var _passwordformKey = GlobalKey<FormState>();
  var _usernameformKey = GlobalKey<FormState>();
  String? _passwordError;
  final List<Map<String, dynamic>> userInfo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login Screen App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Login in',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(height: 80, child: buildUsername()),
                        const SizedBox(height: 10),
                        Container(height: 80, child: buildPassword()),
                        const SizedBox(height: 10),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              _passwordformKey.currentState!.validate();
                              _usernameformKey.currentState!.validate();
                            });
                            addItemToList();
                            _usernameController.clear();
                            _passwordController.clear();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPassword() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Form(
      key: _passwordformKey,
      child: TextFormField(
        validator: (String? value) {
          if (value!.length < 3) {
            return 'Enter at least 3 character';
          } else {
            return null;
          }
        },
        controller: _passwordController,
        maxLength: 30,
        obscureText: _secureText,
        maxLines: 1,
        decoration: InputDecoration(
          errorText: _passwordError,
          hintText: 'Password',
          labelStyle: const TextStyle(fontSize: 15),
          border: OutlineInputBorder(),
          counterText: '',
          suffixIcon: IconButton(
            icon: Icon(_secureText ? Icons.remove_red_eye : Icons.security),
            onPressed: () {
              setState(() {
                _secureText = !_secureText;
              });
            },
          ),
        ),
      ),
    ),
  );
  Widget buildUsername() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Form(
      key: _usernameformKey,
      child: TextFormField(
        validator: (String? value) {
          if (value!.length < 3) {
            return 'Enter at least 3 character';
          } else {
            return null;
          }
        },
        controller: _usernameController,
        maxLength: 30,
        maxLines: 1,
        decoration: InputDecoration(
          errorText: _passwordError,
          hintText: 'User Name',
          labelStyle: const TextStyle(fontSize: 15),
          border: OutlineInputBorder(),
          counterText: '',
        ),
      ),
    ),
  );

  void addItemToList (){
    setState(() {
      userInfo.insert(0, {
        "username": _usernameController.text,
        "password": _passwordController.text,
      });
    });
  }
}