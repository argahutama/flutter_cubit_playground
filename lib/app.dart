import 'package:flutter/material.dart';
import 'package:playground/env.dart';
import 'package:playground/presentation/pages/my_home_page.dart';

import 'injection.dart';

void initApp(Env env) {
  WidgetsFlutterBinding.ensureInitialized();
  AppEnv.setupEnv(env);
  getDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Cat Facts"),
    );
  }
}
