import 'package:flutter/material.dart';
import 'package:term_project0/pages/login.dart';
import 'package:term_project0/authentication/signup.dart';
import 'pages/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*void main() {
  runApp(MaterialApp(
    title: 'Movie Recommendation App',
    home: ProfilePage(),
  ));
}*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.dark,
                useMaterial3: true,
              ),
              home: SignupPage(),
            ),
        designSize: const Size(375, 812));
  }
}
