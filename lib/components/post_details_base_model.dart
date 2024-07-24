import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'post_details_base_widget.dart' show PostDetailsBaseWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostDetailsBaseModel extends FlutterFlowModel<PostDetailsBaseWidget> {
  ///  Local state fields for this component.

  int numOfLikes = 0;

  int numOfcomments = 0;

  bool isLike = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in postDetails_Base widget.
  List<LikesRow>? allLikesOfPost;
  // Stores action output result for [Backend Call - Query Rows] action in postDetails_Base widget.
  List<CommentsRow>? comments;
  // Stores action output result for [Backend Call - Insert Row] action in MediaDisplay widget.
  LikesRow? postLikeInsertedRowDoubleTap;
  // Stores action output result for [Backend Call - Insert Row] action in MediaDisplay widget.
  LikesRow? postLikeInsertedRowUserDoubleTap;
  // Stores action output result for [Backend Call - Insert Row] action in unliked widget.
  LikesRow? postLikeInsertedRowDoubleTap3;
  // Stores action output result for [Backend Call - Insert Row] action in unliked widget.
  LikesRow? postLikeInsertedRowUserDoubleTap3;
  // Stores action output result for [Backend Call - Delete Row(s)] action in liked widget.
  List<LikesRow>? deleteLikeRowWhitelistCopy;
  // Stores action output result for [Backend Call - Delete Row(s)] action in liked widget.
  List<LikesRow>? deleteLikeRowUserCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xz6qjy8b' /* Please fill in the comment... */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
