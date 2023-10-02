import 'package:flutter/material.dart';
import 'package:todo/screens/Homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class ThemeNotifier with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;
  void toggleTheme() {
    _currentTheme = _currentTheme == ThemeData.light()
        ? ThemeData.dark()
        : ThemeData.light();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {"/": (context) => Homescreen()},
      title: 'Flutter Demo',

      theme: Provider.of<ThemeNotifier>(context)
          .currentTheme, // Set the light theme by default
      darkTheme: ThemeData.dark(), // Set the dark theme
      // themeMode: ThemeMode.light, //

      //  Text('Flutter Demo Home Page'),
    );
  }
}




//  SizedBox(height: 20),
//               Consumer<ThemeNotifier>(
//                 builder: (context, notifier, child) => Switch(
//                   value: notifier.currentTheme == ThemeData.dark(),
//                   onChanged: (value) {
//                     notifier.toggleTheme();
//                   },
//                 ),
//               ),
