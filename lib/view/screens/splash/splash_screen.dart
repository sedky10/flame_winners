import 'package:flame_winners/view/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import '../../global/util/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward(from: 0.0);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AuthScreen()));
      }),
      builder: (context, snapshot) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ColorResources.whiteColor,
          child: FadeTransition(
            opacity: _animation,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
               ' ImageAssets.applogo',
              ),
            ),
          ),
        );
      },
    );
  }
}