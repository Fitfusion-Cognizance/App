import 'package:fitnessapp/routes.dart';
import 'package:fitnessapp/utils/app_colors.dart';
import 'package:fitnessapp/view/signup/signup_screen.dart';
import 'package:fitnessapp/view/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zckfmvabmosedzfbgumg.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpja2ZtdmFibW9zZWR6ZmJndW1nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIzMTMzNDcsImV4cCI6MjA1Nzg4OTM0N30.Ungvha9yUuWU9ufDl7r2Dl4jMxBqfp-xV1n0AoWL9yQ',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final bool isLoggedIn = supabase.auth.currentUser != null;

    return MaterialApp(
      title: 'Fitness',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor1,
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: isLoggedIn ? const WelcomeScreen() : const SignupScreen(),
    );
  }
}
