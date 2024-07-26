import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/request_manager.dart';

import 'social_page_dup_widget.dart' show SocialPageDupWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SocialPageDupModel extends FlutterFlowModel<SocialPageDupWidget> {
  ///  Local state fields for this page.

  bool selected = false;

  bool isLiked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Insert Row] action in MediaDisplay widget.
  LikesRow? postLikeInsertedRowDoubleTap;
  // Stores action output result for [Backend Call - Insert Row] action in MediaDisplay widget.
  LikesRow? postLikeInsertedRowUserDoubleTap;
  // Stores action output result for [Backend Call - Insert Row] action in unliked widget.
  LikesRow? postLikeInsertedRow;
  // Stores action output result for [Backend Call - Insert Row] action in unliked widget.
  LikesRow? postLikeInsertedRowUser;
  // Stores action output result for [Backend Call - Delete Row(s)] action in liked widget.
  List<LikesRow>? deleteLikeRowWhitelist;
  // Stores action output result for [Backend Call - Delete Row(s)] action in liked widget.
  List<LikesRow>? deleteLikeRowU;

  /// Query cache managers for this widget.

  final _whiteListUserForPostManager =
      FutureRequestManager<List<WhitelistUsersRow>>();
  Future<List<WhitelistUsersRow>> whiteListUserForPost({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WhitelistUsersRow>> Function() requestFn,
  }) =>
      _whiteListUserForPostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWhiteListUserForPostCache() => _whiteListUserForPostManager.clear();
  void clearWhiteListUserForPostCacheKey(String? uniqueKey) =>
      _whiteListUserForPostManager.clearRequest(uniqueKey);

  final _postQueryManager = FutureRequestManager<List<PostsRow>>();
  Future<List<PostsRow>> postQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostsRow>> Function() requestFn,
  }) =>
      _postQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostQueryCache() => _postQueryManager.clear();
  void clearPostQueryCacheKey(String? uniqueKey) =>
      _postQueryManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearWhiteListUserForPostCache();

    clearPostQueryCache();
  }
}
