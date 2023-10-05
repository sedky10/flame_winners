import 'package:flame_winners/view/global/util/colors.dart';
import 'package:flame_winners/view/global/util/custom_fonts.dart';
import 'package:flame_winners/view/global/util/dimensions.dart';
import 'package:flame_winners/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(Dimensions.main_Screen_Pading),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              Text(
                'Instructions',
                style: heading3Bold,
              ),
              const SizedBox(height: 20,),
              Text(
                '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                style: subTitle1Bold,
              ),
            ],),
            CustomButton(text: 'Send Emergency with photo',backGroundColor: ColorResources.primaryColor,),
          ],
        ),
      ),
    );
  }
}
