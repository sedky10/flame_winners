import 'package:flame_winners/controller/providers/obscure_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../global/util/colors.dart';
import '../global/util/custom_fonts.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool autoFocus;
  final TextInputType keyboardType;
  final bool autocorrect;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Color backgroundColor;
  final BoxShadow boxShadow;

  const CustomTextForm({super.key,
    required this.controller,
    this.hintText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.autoFocus= false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.autocorrect = true,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.backgroundColor = ColorResources.greyColor,
    this.boxShadow = const BoxShadow(
      color: Colors.grey,
      blurRadius: 3,
      offset: Offset(0, 2),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 53.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0.r),
            boxShadow: [boxShadow], // Apply the shadow here
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: ColorResources.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 18.0.w),
            hintText: hintText,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: ColorResources.bailColor,) : null,
            suffixIcon:
            isPassword ?
            Provider.of<ObscureProvider>(context,listen: false).isObscure ?
            IconButton(icon: const Icon(Icons.visibility,color: ColorResources.greyColor,), onPressed: () {Provider.of<ObscureProvider>(context,listen: false).isObscure == false;},) :
            IconButton(icon: const  Icon(Icons.visibility_off_outlined,color: ColorResources.primaryColor), onPressed: () {Provider.of<ObscureProvider>(context,listen: true).isObscure == false;

            },) : null,
            border: InputBorder.none,
            filled: true,
            fillColor: ColorResources.whiteColor,
            hintStyle: bodyTitleMediumBold.copyWith(
              color: ColorResources.bailColor,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0.r),
            ),
          ),
          onTapOutside: (event){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          obscureText: isPassword ?  Provider.of<ObscureProvider>(context).isObscure  : false,
          keyboardType: keyboardType,
          autocorrect: autocorrect,
          autofocus: autoFocus,
          enabled: enabled,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}