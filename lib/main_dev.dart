import 'package:flutter/material.dart';
import 'package:playground/env.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppEnv.setupEnv(Env.dev);
  runApp(const MyApp());
}
