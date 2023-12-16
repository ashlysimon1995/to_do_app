import 'package:flutter/material.dart';
import 'package:to_do_app/controller/sql_functions.dart';
import 'package:to_do_app/view/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  final name_ctrl = TextEditingController();
  final email_ctrl = TextEditingController();
  final pwd_ctrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: name_ctrl,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email_ctrl,
                  decoration: InputDecoration(hintText: 'email id'),
                  validator: (value) {
                    if (email_ctrl.text!.isEmpty ||
                        !email_ctrl.text.contains('@') ||
                        !email_ctrl.text.contains('.com')) {
                      return 'email id must not be empty or must be valid';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pwd_ctrl,
                  validator: (value) {
                    if (pwd_ctrl.text!.isEmpty || pwd_ctrl.text.length < 6) {
                      return 'password must not be empty/password must contain 6 characters';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(hintText: 'password'),
                  obscureText: true,
                ),
                ElevatedButton(
                    onPressed: () {
                      final valid = formKey.currentState!.validate();
                      if (valid) {
                        createRegister(
                            name_ctrl.text, email_ctrl.text, pwd_ctrl.text);
                      }
                    },
                    child: Text("Register")),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createRegister(String name, String email, String pwd) async {
    final id = await sql_register.newregister(name, email, pwd);
    if (id != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Login_todo(uname: email_ctrl.text, password: pwd_ctrl.text)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration not success")));
    }
  }
}
