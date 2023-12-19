import 'package:flutter/material.dart';
import 'package:googlesignin/components/sing_in_page.dart';
import 'package:provider/provider.dart';
import 'components/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign-In',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SignInPage(),
    );
  }
}
