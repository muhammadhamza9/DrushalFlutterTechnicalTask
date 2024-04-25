import 'package:flutter/material.dart';
import 'package:technical_task/src/task_1/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String password = "123456";
  String email = "abc@xyz.com";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Spacer(),
              const FlutterLogo(size: 200),
              const Spacer(flex: 2),
              TextFormField(
                controller: emailCtr,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Please enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              TextFormField(
                controller: passCtr,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "Please enter a password of minimum 6 characters";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Please enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (emailCtr.text == email && passCtr.text == password) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (ctx) => const HomePage()),
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Please enter a valid email and password'),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Login'),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
