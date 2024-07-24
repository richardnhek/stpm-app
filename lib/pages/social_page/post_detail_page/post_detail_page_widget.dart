import '/components/post_details_base_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_detail_page_model.dart';
export 'post_detail_page_model.dart';

class PostDetailPageWidget extends StatefulWidget {
  const PostDetailPageWidget({
    super.key,
    required this.postId,
    required this.posteOwner,
  });

  final int? postId;
  final String? posteOwner;

  @override
  State<PostDetailPageWidget> createState() => _PostDetailPageWidgetState();
}

class _PostDetailPageWidgetState extends State<PostDetailPageWidget> {
  late PostDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.postDetailsBaseModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: PostDetailsBaseWidget(
                    postId: widget!.postId!,
                    postOwner: widget!.posteOwner!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
