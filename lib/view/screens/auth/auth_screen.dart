import 'package:flame_winners/view/screens/navigation/navigation.dart';
import 'package:flame_winners/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomButton(
              text: 'to home screen',
              height: 40,
              width: MediaQuery.of(context).size.width - 20,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
