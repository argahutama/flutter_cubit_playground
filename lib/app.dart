import 'package:common/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/cubit/cat_facts_cubit.dart';
import 'package:home/pages/my_home_page.dart';

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
      home: BlocProvider(
        create: (context) => CatFactsCubit(),
        child: const MyHomePage(title: 'Cat Facts'),
      ),
    );
  }
}
