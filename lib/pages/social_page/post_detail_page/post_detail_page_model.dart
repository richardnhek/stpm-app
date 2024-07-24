import '/components/post_details_base_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'post_detail_page_widget.dart' show PostDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostDetailPageModel extends FlutterFlowModel<PostDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for postDetails_Base component.
  late PostDetailsBaseModel postDetailsBaseModel;

  @override
  void initState(BuildContext context) {
    postDetailsBaseModel = createModel(context, () => PostDetailsBaseModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    postDetailsBaseModel.dispose();
  }
}
