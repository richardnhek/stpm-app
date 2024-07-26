import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/more_about_post_widget.dart';
import '/components/post_shimmer_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:math';
import 'user_post_component_widget.dart' show UserPostComponentWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UserPostComponentModel extends FlutterFlowModel<UserPostComponentWidget> {
  ///  Local state fields for this component.

  bool isLikeStarted = true;

  bool? isLiked;

  int numOfLikes = 0;

  int numOfComments = 0;

  bool isComment = false;

  bool isLoaded = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in UserPostComponent widget.
  List<LikesRow>? allLikesOfPost;
  // Stores action output result for [Backend Call - Query Rows] action in UserPostComponent widget.
  List<CommentsRow>? comments;
  // Stores action output result for [Backend Call - Insert Row] action in MediaDisplay widget.
  LikesRow? postLikeInsertedRowDoubleTap;
  // Stores action output result for [Backend Call - Insert Row] action in MediaDisplay widget.
  LikesRow? postLikeInsertedRowUserDoubleTap;
  // Stores action output result for [Backend Call - Insert Row] action in unliked widget.
  LikesRow? postLikeInsertedRowDoubleTap2;
  // Stores action output result for [Backend Call - Insert Row] action in unliked widget.
  LikesRow? postLikeInsertedRowUserDoubleTap2;
  // Stores action output result for [Backend Call - Delete Row(s)] action in liked widget.
  List<LikesRow>? deleteLikeRowWhitelistCopy;
  // Stores action output result for [Backend Call - Delete Row(s)] action in liked widget.
  List<LikesRow>? deleteLikeRowUserCopy;
  // Model for PostShimmerComponent component.
  late PostShimmerComponentModel postShimmerComponentModel;

  @override
  void initState(BuildContext context) {
    postShimmerComponentModel =
        createModel(context, () => PostShimmerComponentModel());
  }

  @override
  void dispose() {
    postShimmerComponentModel.dispose();
  }
}
