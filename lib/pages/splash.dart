import 'package:flutter/material.dart';
import 'package:flutter_colombia/pages/mainpage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  _navigatetoHome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bgSplash.jpg"), fit: BoxFit.cover),
      ),
      child: Center(child: Image(image: AssetImage("images/logo.png"))),
    );
  }
}
