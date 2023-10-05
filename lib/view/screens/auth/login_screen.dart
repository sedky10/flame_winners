
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flame_winners/data/network/firebase_auth_services/firebase_auth_services.dart';
import 'package:flame_winners/view/global/util/images.dart';
import 'package:flame_winners/view/screens/navigation/navigation.dart';
import 'package:flame_winners/view/widgets/custom_button.dart';
import 'package:flame_winners/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../global/util/colors.dart';
import '../../global/util/custom_fonts.dart';
import '../../global/util/validation.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  AssetsImages.backGround,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: heading1Bold.copyWith(
                        color: ColorResources.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "please sign in to continue",
                      style: heading2.copyWith(
                        color: ColorResources.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    CustomTextForm(
                        validator: FormValidators.validateEmail,
                        controller: emailController,
                        prefixIcon: Icons.email_outlined,
                        hintText: "Email"),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextForm(
                        validator: FormValidators.validatePassword,
                        controller: passwordController,
                        prefixIcon: Icons.lock_outline,
                        hintText: "Password"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        "forgot password ?",
                        style: bodyTitleMediumBold.copyWith(
                          color: ColorResources.bailColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          " Reset Password",
                          style: bodyTitleMediumBold.copyWith(
                            color: ColorResources.primaryColor,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 85,
                    ),
                    CustomButton(
                        text: 'LOGIN',
                        onTap: () async {
                          await onButtonSubmit(context);
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Don’t have an account ?",
                        style: bodyTitleMediumBold.copyWith(
                          color: ColorResources.bailColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          " Sign up",
                          style: bodyTitleMediumBold.copyWith(
                            color: ColorResources.whiteColor,
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onButtonSubmit(context) async {
    if (_formKey.currentState!.validate()) {
      try {
         UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (credential.user != null) {
          // Sign-in was successful
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'تم تسجيل الدخول بنجاح',
                textDirection: TextDirection.rtl,
              ),
              backgroundColor: ColorResources.primaryColor,
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationScreen(),
            ),
          );
        } else {
          // Handle the case where credential.user is null
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'تعذر تسجيل الدخول. البريد الإلكتروني أو كلمة المرور غير صحيحة.',
                textDirection: TextDirection.rtl,
              ),
              backgroundColor: ColorResources.primaryColor,
            ),
          );
        }
      } catch (e) {
        // Handle specific Firebase exceptions
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'المستخدم غير موجود',
                  textDirection: TextDirection.rtl,
                ),
                backgroundColor: ColorResources.primaryColor,
              ),
            );
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'كلمة المرور غير صحيحة',
                  textDirection: TextDirection.rtl,
                ),
                backgroundColor: ColorResources.primaryColor,
              ),
            );
          } else {
            print("--------------------->${e.code.toString()}");
            print("--------------------->${e.credential.toString()}");
            // Handle other Firebase exceptions if necessary
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'حدث خطأ داخلي. يرجى المحاولة مرة أخرى في وقت لاحق.',
                  textDirection: TextDirection.rtl,
                ),
                backgroundColor: ColorResources.primaryColor,
              ),
            );
          }
        } else {
          // Handle non-Firebase exceptions if necessary
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى في وقت لاحق.',
                textDirection: TextDirection.rtl,
              ),
              backgroundColor: ColorResources.primaryColor,
            ),
          );
        }
      }
    }
  }
}
