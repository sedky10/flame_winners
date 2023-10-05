import 'package:flame_winners/view/global/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global/util/custom_fonts.dart';


class CustomButton extends StatelessWidget {
  String? text;
  VoidCallback? onTap;

  CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.backGroundColor = ColorResources.primaryColor,
    this.textColor=ColorResources.whiteColor,
    this.width= double.infinity,
    this.fontSize= 15,
    this.height=48,
  });
  Color? backGroundColor=Colors.white;
  Color? textColor=Colors.white;
  double width ;
  double height;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onTap,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        fixedSize: MaterialStateProperty.all(Size(width, height)),
        backgroundColor: MaterialStateProperty.all(backGroundColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.sp),
          ),
        ),
      ),
      child: Center(
        child: Text('$text',
            style: buttonTitleBold.copyWith(
              color:textColor,
              fontSize:fontSize,
            )),
      ),
    );
  }
}