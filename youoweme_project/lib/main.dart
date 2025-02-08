import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/repositories/local_repository.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';
import 'package:youoweme_project/views/pages/contact_page.dart';
import 'package:youoweme_project/views/pages/home_page.dart';
import 'package:youoweme_project/views/pages/settings_page.dart';

void main() {
  LocalRepository _repo = LocalRepository();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocalViewModel(repo: _repo),
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
      // * App default settings
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      //* routes
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/contact': (context) => ContactPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
