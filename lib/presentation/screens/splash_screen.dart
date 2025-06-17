import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/widgets/background_circles_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 182, 35, 39),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 198, 40, 40),
            Color.fromARGB(255, 228, 55, 52), // highlight
            Color.fromARGB(255, 183, 28, 28), // shadow
            Color.fromARGB(255, 198, 40, 40),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 0.25, 0.65, 1.0],
          )
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child:
              CustomPaint(
                painter: BackgroundCirclesWidget(),
              )
            ),
            Center(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 126, 25, 28),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 224,
                height: 224,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 126, 25, 28),
                  borderRadius: BorderRadius.circular(110)
                ),
              ),
            ),
            Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(110)
                ),
              ),
            ),
            Center(
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft, // Horizontal gradient for black
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 20, 20, 20), // Dark grey
                      Color.fromARGB(255, 53, 53, 53), // Mid grey
                      Color.fromARGB(255, 61, 61, 61), // Lighter grey (highlight)
                      Color.fromARGB(255, 53, 53, 53), // Mid grey
                      Color.fromARGB(255, 20, 20, 20), // Dark grey
                    ],
                    stops: [0.0, 0.25, 0.5, 0.75, 1.0], // More stops for subtle shine
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 202, 239, 245),
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
            ),
            Center(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 202, 239, 245),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.6),
              child: Text(
                'Press to continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
            )
          ],
        ),
      ),
    );
  }
}