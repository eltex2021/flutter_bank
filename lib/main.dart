import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bank/screens/auth_screen/auth_screen.dart';
import 'package:flutter_bank/screens/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:flutter_bank/screens/home/bottom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc(),
        //child: MainScreen(),
        child: AuthScreen(),
      ),
    );
  }
}
