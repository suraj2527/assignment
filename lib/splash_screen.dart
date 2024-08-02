import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: const SplashScreen(

      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var logoSize = screenWidth * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xFF365AFF),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: _visible ? logoSize : 0,
                    height: _visible ? logoSize : 0,
                    child: Container(
                        child: Image.asset('images/logo.png')),
                  ),
                  const SizedBox(height: 10),
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: Column(
                      children: [
                        Text(
                          'Think',
                          style: GoogleFonts.lora(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFF3131),
                          ),

                        ),
                        const SizedBox(height: 10),
                    Text(
                      'Made in India with love',
                      style: GoogleFonts.lora(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFDA45),
                      ),
                    ),
                    ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
