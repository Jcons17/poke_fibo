import 'package:flutter/material.dart';
import 'package:flutter_template/core/my_app_widget.dart';
import 'package:flutter_template/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}
