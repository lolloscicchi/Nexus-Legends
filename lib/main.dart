import 'package:flutter/material.dart';
import 'package:nexus_legend/auth.dart';
import 'Pages/home.dart';
import 'Pages/login.dart';
import 'Pages/search.dart';
import 'Pages/info.dart';
import 'Components/bottomNavigation.dart';
import 'Pages/loading.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MainApp());}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexus Legend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: StreamBuilder(
          stream: Auth().authStateChanges,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return LoadingPage();
            }else{
              return LoginPage();
            }
          }),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    Homepage(),
    SearchPage(),
    InfoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}