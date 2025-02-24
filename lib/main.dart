import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colombia/firebase_options.dart';
import 'package:flutter_colombia/pages/add_lugar.dart';
import 'package:flutter_colombia/pages/edit_lugar.dart';
import 'package:flutter_colombia/pages/mainpage.dart';
import 'package:flutter_colombia/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MainPage(),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const MainPage(),
        '/splash': (context) => const Splash(),
        '/add': (context) => const AddLugar(),
        "/edit": (context) => const EditLugar()
      },
    );
  }
}
