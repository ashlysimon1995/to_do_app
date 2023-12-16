import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/view/Homescreen.dart';

class Login_todo extends StatelessWidget {
//  const Login_todo({super.key});

  String? uname;
  String? password;
  Login_todo({required String this.uname, required this.password});
  final uname_ctrl = TextEditingController();
  final pass_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: uname_ctrl,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: pass_ctrl,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (uname_ctrl.text == "$uname" &&
                      pass_ctrl.text == "$password") {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home_screen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Incorrect username and password")));
                  }
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
