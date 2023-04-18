import 'package:flutter/material.dart';

import 'app.dart';
import 'env.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppEnv.setupEnv(Env.stg);
  runApp(const MyApp());
}
