import 'package:flutter/material.dart';

import 'utilities/router.dart';
import 'utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFE5E5E5),
          primaryColor: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.subtitle1,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          )),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.loginPageRoute,
    );
  }
}