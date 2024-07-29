import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocket/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stocket/utils.dart';

void main() async{
  await registerService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      routes: {
        "/home": (context)=> HomePage(),
      },
      initialRoute: "/home",
    );
  }
}
