import 'package:flutter/material.dart';
import 'environment.dart';
import 'root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.init(
    apiBaseUrl: 'https://cashier-api.housenet.am/api/auth',
  );

  runApp(const RootApp());
}
