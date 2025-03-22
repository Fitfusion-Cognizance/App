import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Sign Up
  Future<String?> signUp(String email, String password, String firstName, String lastName) async {
    try {
      // Sign up user
      final response = await _supabase.auth.signUp(email: email, password: password);

      final user = response.user;
      if (user == null) {
        return "Sign-up failed. Please try again.";
      }

      // Insert user details into the 'users' table
      await _supabase.from('users').insert({
        'id': user.id,  // Store the same ID as in the auth table
        'name' : "$firstName $lastName",
      });

      return "Sign-up successful! Check your email to verify.";
    } catch (e) {
      print("Error: ${e.toString()}");
      return "Error: ${e.toString()}";
    }
  }


  // Sign In
  Future<String?> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(email: email, password: password);
      return response.session != null ? "Login successful" : "Login failed";
    } catch (e) {
      return "Error: ${e.toString()}";
    }
  }

  // Sign Out
  Future<bool> signOut() async {
    try {
      await _supabase.auth.signOut();
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      return false;
    }
  }

  // Get Current User
  User? getCurrentUser() {
    return _supabase.auth.currentUser;
  }

  Future<void> storeUserData(Map<String, String> userData, String goal) async {
    try {
      final user = _supabase.auth.currentUser;

      if (user == null) {
        print("Error: No authenticated user found.");
        return;
      }

      await _supabase.from('users').update({
        'gender': userData['gender'],
        'dob': userData['dob'],
        'weight': userData['weight'],
        'height': userData['height'],
        'goal': goal,
      }).eq('id', user.id); // Ensuring data is stored for the correct user

      print("User data updated successfully!");
    } catch (e) {
      print("Error storing user data: ${e.toString()}");
    }
  }

}
