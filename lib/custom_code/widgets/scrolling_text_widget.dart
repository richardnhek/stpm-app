// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
class ScrollingTextWidget extends StatefulWidget {
  final dynamic jsonBody;
  final double? width;
  final double? height;

  ScrollingTextWidget({required this.jsonBody, this.width, this.height});

  @override
  _ScrollingTextWidgetState createState() => _ScrollingTextWidgetState();
}

class _ScrollingTextWidgetState extends State<ScrollingTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
    _scrollController = ScrollController();

    _controller.addListener(() {
      setState(() {
        _scrollOffset += 1;
        if (_scrollController.hasClients) {
          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
            _scrollController.jumpTo(0);
            _scrollOffset = 0;
          } else {
            _scrollController.jumpTo(_scrollOffset);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allAnnouncements = getJsonField(
      widget.jsonBody,
      r'''$.data''',
    ).toList();

    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: allAnnouncements.length, // No need to double the count
      itemBuilder: (context, index) {
        final allAnnouncementsItem =
            allAnnouncements[index % allAnnouncements.length];
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Text(
            getJsonField(
              allAnnouncementsItem,
              r'''$.attributes.Title''',
            ).toString(),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        );
      },
    );
  }
}
