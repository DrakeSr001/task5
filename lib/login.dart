import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool isPassword = false;
  Icon icon = Icon(Icons.visibility_off);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.grey[300],
      ),
      body: Form(
        child: Column(children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 20, color: Colors.red),
            decoration: const InputDecoration(
                hintText: 'Email', hintStyle: TextStyle(color: Colors.green)),
          ),


          TextFormField(
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 20, color: Colors.blue),
            obscureText: !isPassword,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: isPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                label: Text("Password"),
                labelStyle: TextStyle(color: Colors.blue)),
          ),
        ]),
      ),
    );
  }
}