import 'package:evently/widgets/default_elevated_button.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 28,
                  fit: .scaleDown,
                ),
              ),
              Spacer(),
              Text('Login to your account', style: textTheme.headlineMedium),
              SizedBox(height: 24),
              DefaultTextFormField(
                hintText: 'Enter your email',
                prefixIconImageName: 'email',
                controller: emailController,
              ),
              SizedBox(height: 16),
              DefaultTextFormField(
                hintText: 'Enter your password',
                prefixIconImageName: 'password',
                controller: passwordController,
                isPassword: true,
              ),
              Spacer(flex: 1),
              DefaultElevatedButton(label: 'Login', onPressed: login),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text('Don’t have an account?', style: textTheme.titleSmall),
                  TextButton(onPressed: () {}, child: Text('Register')),
                ],
              ),
              Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }

  void login() {}
}
