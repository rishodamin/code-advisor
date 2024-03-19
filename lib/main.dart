import 'package:code_adviser_ai/provider/code_provider.dart';
import 'package:code_adviser_ai/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CodeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Noto Sans',
        colorSchemeSeed: Colors.purple,
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontFamily: 'Damin',
            fontSize: 18,
          ),
          // titleMedium: TextStyle(
          //     fontFamily: 'Noto Sans',
          //     fontSize: 20,
          //     fontWeight: FontWeight.w500),
          // titleLarge: TextStyle(
          //   fontFamily: 'Noto Sans',
          //   fontSize: 32,
          //   fontWeight: FontWeight.w700,
          // ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
