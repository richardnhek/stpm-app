import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'public_profile_components_widget.dart'
    show PublicProfileComponentsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PublicProfileComponentsModel
    extends FlutterFlowModel<PublicProfileComponentsWidget> {
  ///  Local state fields for this component.

  bool isFollow = false;

  int? numOfPost;

  int numOfFollower = 0;

  int numOfFollowing = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in PublicProfileComponents widget.
  List<PostsRow>? postList;
  // Stores action output result for [Backend Call - Query Rows] action in PublicProfileComponents widget.
  List<FollowsRow>? follows;
  // Stores action output result for [Backend Call - Query Rows] action in PublicProfileComponents widget.
  List<FollowsRow>? following;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
