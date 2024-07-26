import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  String? contents;

  String? image;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for Title widget.
  FocusNode? titleFocusNode1;
  TextEditingController? titleTextController1;
  String? Function(BuildContext, String?)? titleTextController1Validator;
  // State field(s) for PosDescription widget.
  FocusNode? posDescriptionFocusNode1;
  TextEditingController? posDescriptionTextController1;
  String? Function(BuildContext, String?)?
      posDescriptionTextController1Validator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Title widget.
  FocusNode? titleFocusNode2;
  TextEditingController? titleTextController2;
  String? Function(BuildContext, String?)? titleTextController2Validator;
  // State field(s) for PosDescription widget.
  FocusNode? posDescriptionFocusNode2;
  TextEditingController? posDescriptionTextController2;
  String? Function(BuildContext, String?)?
      posDescriptionTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode1?.dispose();
    titleTextController1?.dispose();

    posDescriptionFocusNode1?.dispose();
    posDescriptionTextController1?.dispose();

    titleFocusNode2?.dispose();
    titleTextController2?.dispose();

    posDescriptionFocusNode2?.dispose();
    posDescriptionTextController2?.dispose();
  }
}
