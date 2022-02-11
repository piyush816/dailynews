import 'package:dailynews/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: Colors.grey[900]),
      ),
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        body: const HomeScreen(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.trending_up,
                ),
                label: "Trending"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later), label: "Watch Later"),
          ],
        ),
        appBar: AppBar(
          elevation: 0.0,
          actions: const [
            Icon(Icons.search),
          ],
          title: const Text("DailyNews"),
        ),
      ),
    );
  }
}
