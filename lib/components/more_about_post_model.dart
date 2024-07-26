import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'more_about_post_widget.dart' show MoreAboutPostWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoreAboutPostModel extends FlutterFlowModel<MoreAboutPostWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Delete Row(s)] action in component widget.
  List<PostsRow>? deletePostByOwner;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
