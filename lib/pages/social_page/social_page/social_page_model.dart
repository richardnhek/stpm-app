import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/component/user_post_component/user_post_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/request_manager.dart';

import 'social_page_widget.dart' show SocialPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SocialPageModel extends FlutterFlowModel<SocialPageWidget> {
  ///  Local state fields for this page.

  bool selected = false;

  bool isLiked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for UserPostComponent dynamic component.
  late FlutterFlowDynamicModels<UserPostComponentModel> userPostComponentModels;

  /// Query cache managers for this widget.

  final _postOwnerQueryCacheManager =
      FutureRequestManager<List<WhitelistUsersRow>>();
  Future<List<WhitelistUsersRow>> postOwnerQueryCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WhitelistUsersRow>> Function() requestFn,
  }) =>
      _postOwnerQueryCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostOwnerQueryCacheCache() => _postOwnerQueryCacheManager.clear();
  void clearPostOwnerQueryCacheCacheKey(String? uniqueKey) =>
      _postOwnerQueryCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    userPostComponentModels =
        FlutterFlowDynamicModels(() => UserPostComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userPostComponentModels.dispose();

    /// Dispose query cache managers for this widget.

    clearPostOwnerQueryCacheCache();
  }
}
