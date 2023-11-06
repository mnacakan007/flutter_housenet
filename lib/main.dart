import 'package:flutter/material.dart';
import 'environment.dart';
import 'root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.init(
    apiBaseUrl: 'https://jsonplaceholder.typicode.com',
  );

  runApp(const RootApp());
}
