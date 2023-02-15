import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/auth_provider.dart';
import 'package:testapp/login.dart';
import 'package:testapp/value_validators.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, auth, child) {
      return Scaffold(
          appBar: AppBar(title: const Text('SignUp'), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: nameCtrl,
                            validator: (val) =>
                                ValueValidator().validateName(val!),
                            decoration: const InputDecoration(
                              hintText: 'Enter your name here',
                              labelText: "Name",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: emailCtrl,
                            validator: (val) =>
                                ValueValidator().validateEmail(val!),
                            decoration: const InputDecoration(
                              hintText: 'Enter your Email here',
                              labelText: "Email",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: passwordCtrl,
                            validator: (val) =>
                                ValueValidator().validatePassword(val!),
                            decoration: const InputDecoration(
                              hintText: '*********',
                              labelText: "password",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue)),
                            onPressed: () {
                              formKey.currentState!.validate()
                                  ? auth.signup(nameCtrl.text, emailCtrl.text,
                                      passwordCtrl.text, context)
                                  : AutovalidateMode.onUserInteraction;
                            },
                            child: const Text('SignUp'),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: Text("Already have an account? login")),
                        ],
                      ),
                    ))),
          ));
    });
  }
}
