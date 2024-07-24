import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'o_t_p_confirm_dialog_widget.dart' show OTPConfirmDialogWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OTPConfirmDialogModel extends FlutterFlowModel<OTPConfirmDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - confirmOtp] action in Button widget.
  bool? isSuccessOTPConfirmation;
  // Stores action output result for [Custom Action - getCurrentUserUid] action in Button widget.
  String? phoneAuthCurrentUserUid;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? supabaseExistingUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUserFromPhone;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
