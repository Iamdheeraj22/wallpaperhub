import 'package:flutter/material.dart';
import 'package:wallpaperhub/Pages/HomePage.dart';
import 'package:wallpaperhub/app_config/app_routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Hub',
      theme: ThemeData(primaryColor: Colors.white),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: HomePage(),
    );
  }
}
