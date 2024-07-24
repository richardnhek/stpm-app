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

Future<String?> getCurrentUserUid() async {
  // Add your function code here!
  final supabase = Supabase.instance.client;
  final Session? session = supabase.auth.currentSession;

  if (session != null && session.user != null) {
    return session.user!.id;
  } else {
    // Handle the case when there is no authenticated user
    return null;
  }
}
