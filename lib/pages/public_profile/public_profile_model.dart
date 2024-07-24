import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/component/user_post_component/user_post_component_widget.dart';
import '/components/public_profile_components_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'public_profile_widget.dart' show PublicProfileWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PublicProfileModel extends FlutterFlowModel<PublicProfileWidget> {
  ///  Local state fields for this page.

  dynamic whitelistData;

  int? likes;

  int? postnum;

  int? numOfFollower;

  bool isFollow = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PublicProfileComponents component.
  late PublicProfileComponentsModel publicProfileComponentsModel;
  Completer<List<WhitelistUsersRow>>? requestCompleter;
  // Models for UserPostComponent dynamic component.
  late FlutterFlowDynamicModels<UserPostComponentModel> userPostComponentModels;

  /// Query cache managers for this widget.

  final _postInPublicProfileManager =
      FutureRequestManager<List<WhitelistUsersRow>>();
  Future<List<WhitelistUsersRow>> postInPublicProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WhitelistUsersRow>> Function() requestFn,
  }) =>
      _postInPublicProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostInPublicProfileCache() => _postInPublicProfileManager.clear();
  void clearPostInPublicProfileCacheKey(String? uniqueKey) =>
      _postInPublicProfileManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    publicProfileComponentsModel =
        createModel(context, () => PublicProfileComponentsModel());
    userPostComponentModels =
        FlutterFlowDynamicModels(() => UserPostComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    publicProfileComponentsModel.dispose();
    userPostComponentModels.dispose();

    /// Dispose query cache managers for this widget.

    clearPostInPublicProfileCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
