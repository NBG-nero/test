import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/value_validators.dart';

import 'auth_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, auth, child) {
      return Scaffold(
          appBar: AppBar(title: const Text('Login'), centerTitle: true),
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
                                  ? auth.login(emailCtrl.text,
                                      passwordCtrl.text, context)
                                  : AutovalidateMode.onUserInteraction;
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ))),
          ));
    });
  }
}
