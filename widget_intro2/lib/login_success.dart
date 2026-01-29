import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Welcome back....', style: TextStyle(fontSize: 30)),
              ElevatedButton(
                onPressed: () {
                  // Logic của Logout (liên quan session, clear data...)
                  Navigator.pop(context);
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
