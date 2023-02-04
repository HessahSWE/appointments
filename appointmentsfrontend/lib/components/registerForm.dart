import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'button.dart';
import '../main.dart';
import '../model/authModel.dart';
import '../provider/dioProvider.dart';
import '../utils/config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'username',
              labelText: 'username',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.person),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'email',
              labelText: 'email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.person),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outline),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePass = obscurePass;
                  });
                },
                icon: obscurePass
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black38,
                      ) // Icon
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Config.primaryColor,
                      ),
              ),
            ), // Icon // IconButton // Input Decoration
          ),
          Config.spaceSmall,
          Consumer<AuthModel>(
            builder: ((context, auth, child) {
              return Button(
                  width: double.infinity,
                  title: 'Sign Up',
                  onPressed: () async {
                    final userRegistration = await DioProvider().registerUser(
                        _nameController.text,
                        _emailController.text,
                        _passController.text);
                    print('kkkkkkkkkkkkkkk');
                    print(userRegistration);
                    print('kkkkkkkkkkkkkkk');
                    if (userRegistration) {
                      final token = await DioProvider().getToken(
                          _emailController.text, _passController.text);
                      if (token) {
                        auth.loginSuccess();
                        MyApp.navigationKey.currentState?.pushNamed('main');
                      }
                    } else {
                      print('register not successful');
                    }
                  },
                  disable: false);
            }),
          )
        ],
      ),
    );
  }
}
