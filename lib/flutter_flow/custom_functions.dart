import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String formatDateString(String isoDateString) {
  DateTime dateTime = DateTime.parse(isoDateString);
  String formattedDate = DateFormat('MM/dd/yyyy HH:mm').format(dateTime);
  return formattedDate;
}

bool checkNullSupabaseString(String? thisStringValue) {
  return thisStringValue == null;
}

bool hasUploadedMedia(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

bool checkNullData(DataStruct? thisData) {
  return thisData == null;
}
