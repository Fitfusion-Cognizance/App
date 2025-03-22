import 'package:fitnessapp/utils/app_colors.dart';
import 'package:fitnessapp/view/profile/widgets/setting_row.dart';
import 'package:fitnessapp/view/profile/widgets/title_subtitle_cell.dart';
import 'package:fitnessapp/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common_widgets/round_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final supabase = Supabase.instance.client;
  String userName = "Loading...";
  String userEmail = "";
  String userGoal = "Fitness Goal";

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email ?? "No Email";
      });

      // Fetch additional details from `users` table
      final response = await supabase
          .from('users')
          .select('first_name, goal')
          .eq('id', user.id)
          .single();

      if (response != null) {
        setState(() {
          userName = response['first_name'] ?? "User";
          userGoal = response['goal'] ?? "Fitness Goal";
        });
      }
    }
  }

  Future<void> _logout() async {
    await supabase.auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/user.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        userGoal,
                        style: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 2),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SettingRow(
                    icon: "assets/icons/p_personal.png",
                    title: "Personal Data",
                    onPressed: () {},
                  ),
                  SettingRow(
                    icon: "assets/icons/p_privacy.png",
                    title: "Privacy Policy",
                    onPressed: () {},
                  ),
                  SettingRow(
                    icon: "assets/icons/lock_icon.png",
                    title: "Logout",
                    onPressed: _logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
