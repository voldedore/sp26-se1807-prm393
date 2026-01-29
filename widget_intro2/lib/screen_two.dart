import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  } // Good practices khi sử dụng controller?

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Login', style: TextStyle(fontSize: 28)),
            // Text field
            // Wdiget: Form, TextFormField, form validator??, Snackbar
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    // handle input của user bằng controller
                    controller: _usernameTextController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập email'; // Error msg
                      }
                      return null; // input is valid
                    },
                  ),
                  TextFormField(
                    controller: _passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Xứ lý đăng nhập,
                  if (_usernameTextController.text == 'admin' &&
                      _passwordTextController.text == 'password') {
                    // Đăng nhập thành côngs,
                    // chuyển hướng user (route) qua 1 screen khác screen stack
                    Navigator.pushNamed(context, '/login_success');
                    // Navigator.
                    print('Login success');
                  } else {
                    // Hiển thị Snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed'),
                        backgroundColor: Colors.red,
                        showCloseIcon: true,
                        closeIconColor: Colors.white,
                      ),
                    );
                  }
                } else {
                  print('Form invalid');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
