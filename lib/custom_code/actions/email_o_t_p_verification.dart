// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> emailOTPVerification(
  String emailAddress,
  String verificationToken,
) async {
  final supabaseClient = Supabase.instance.client;

  // Add your function code here!
  try {
    final response = await supabaseClient.auth.verifyOTP(
      email: emailAddress,
      token: verificationToken,
      type: OtpType.signup,
    );
    return true;
  } catch (e) {
    print("Error verifying OTP: $e");
    return false;
  }
}
