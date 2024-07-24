import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'telegram_page_model.dart';
export 'telegram_page_model.dart';

class TelegramPageWidget extends StatefulWidget {
  const TelegramPageWidget({super.key});

  @override
  State<TelegramPageWidget> createState() => _TelegramPageWidgetState();
}

class _TelegramPageWidgetState extends State<TelegramPageWidget> {
  late TelegramPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelegramPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await launchURL('https://t.me/Dr_Hunmanetofcambodia');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: FlutterFlowWebView(
          content: 'https://t.me/Dr_Hunmanetofcambodia',
          bypass: true,
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          verticalScroll: false,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
