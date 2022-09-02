import 'package:ecommerce/utilities/enums.dart';
import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

import '../widgets/main_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _authType = AuthFormType.login;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60.0,
            horizontal: 32.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authType == AuthFormType.login ? 'Login' : 'Register',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 80.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your email!' : null,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email!',
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your password!' : null,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your pasword!',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  if (_authType == AuthFormType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: const Text('Forgot your password?'),
                        onTap: () {},
                      ),
                    ),
                  const SizedBox(height: 24.0),
                  MainButton(
                    text:
                        _authType == AuthFormType.login ? 'Login' : 'Register',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.dashboardPageRoute);
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(
                        _authType == AuthFormType.login
                            ? 'Don\'t have an account? Register'
                            : 'Have an account? Login',
                      ),
                      onTap: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          if (_authType == AuthFormType.login) {
                            _authType = AuthFormType.register;
                          } else {
                            _authType = AuthFormType.login;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.11),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        _authType == AuthFormType.login
                            ? 'Or Login with'
                            : 'Or Register with',
                        style: Theme.of(context).textTheme.subtitle1,
                      )),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/facebook.jpg'),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        child: Image.asset('assets/images/google.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
