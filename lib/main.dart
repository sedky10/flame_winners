import 'package:flame_winners/view/global/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'controller/providers/theme_provider.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

 main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize:  Size(MediaQuery.of(context).size.width , MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          localizationsDelegates:const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate
          ],
          home: child,
          supportedLocales: S.delegate.supportedLocales,
          theme: light,
        );
      },
      child: const Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
