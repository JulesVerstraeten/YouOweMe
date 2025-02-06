import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/repositories/localRepository.dart';
import 'package:youoweme_project/core/services/localService.dart';
import 'package:youoweme_project/viewmodels/localViewModel.dart';
import 'package:youoweme_project/views/pages/home_page.dart';
import 'package:youoweme_project/views/pages/settings_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocalViewModel(LocalService(repo: LocalRepository())),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
