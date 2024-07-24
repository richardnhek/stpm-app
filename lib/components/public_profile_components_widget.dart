import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'public_profile_components_model.dart';
export 'public_profile_components_model.dart';

class PublicProfileComponentsWidget extends StatefulWidget {
  const PublicProfileComponentsWidget({
    super.key,
    this.photoUrl,
    this.displayName,
    this.email,
    this.bio,
    required this.userID,
  });

  final String? photoUrl;
  final String? displayName;
  final String? email;
  final String? bio;
  final String? userID;

  @override
  State<PublicProfileComponentsWidget> createState() =>
      _PublicProfileComponentsWidgetState();
}

class _PublicProfileComponentsWidgetState
    extends State<PublicProfileComponentsWidget> with TickerProviderStateMixin {
  late PublicProfileComponentsModel _model;

  var hasButtonTriggered1 = false;
  var hasButtonTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicProfileComponentsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.postList = await PostsTable().queryRows(
        queryFn: (q) => q.eq(
          'post_owner',
          widget!.userID,
        ),
      );
      _model.follows = await FollowsTable().queryRows(
        queryFn: (q) => q.eq(
          'whitelist_user',
          widget!.userID,
        ),
      );
      _model.following = await FollowsTable().queryRows(
        queryFn: (q) => q.eq(
          'whitelist_user_followers',
          widget!.userID,
        ),
      );
      _model.numOfPost = _model.postList?.length;
      _model.numOfFollower = _model.follows!.length;
      _model.numOfFollowing = _model.following!.length;
      if (FFAppState().isWhiteListUser == true) {
        if ((_model.follows
                        ?.where(
                            (e) => e.whitelistUserFollowers == currentUserUid)
                        .toList() !=
                    null &&
                (_model.follows
                        ?.where(
                            (e) => e.whitelistUserFollowers == currentUserUid)
                        .toList())!
                    .isNotEmpty) ==
            true) {
          _model.isFollow = true;
          setState(() {});
        } else {
          _model.isFollow = false;
          setState(() {});
        }

        return;
      } else {
        if ((_model.follows
                        ?.where((e) => e.follower == currentUserUid)
                        .toList() !=
                    null &&
                (_model.follows
                        ?.where((e) => e.follower == currentUserUid)
                        .toList())!
                    .isNotEmpty) ==
            true) {
          _model.isFollow = true;
          setState(() {});
        } else {
          _model.isFollow = false;
          setState(() {});
        }

        return;
      }
    });

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.5, 0.5),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.5, 0.5),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.85, 0.68),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 0.0),
                    child: Container(
                      width: 90.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45.0),
                          child: Image.network(
                            widget!.photoUrl!,
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget!.displayName,
                          'name',
                        ),
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.email,
                              'email',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFFEE8B60),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Lexend Deca'),
                                ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      _model.numOfPost?.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily),
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '22i1r919' /* Posts */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    formatNumber(
                                      _model.numOfFollower,
                                      formatType: FormatType.compact,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily),
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'esez1oq5' /* Followers */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    _model.numOfFollowing.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily),
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'rbdden3r' /* Following */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 5.0)),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
              child: Text(
                widget!.bio!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: Colors.black,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            child: Container(
              width: double.infinity,
              height: 40.0,
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  if (_model.isFollow == false) {
                    return FFButtonWidget(
                      onPressed: () async {
                        _model.numOfFollower = _model.numOfFollower + 1;
                        _model.isFollow = true;
                        setState(() {});
                        if (animationsMap['buttonOnActionTriggerAnimation2'] !=
                            null) {
                          setState(() => hasButtonTriggered2 = true);
                          SchedulerBinding.instance.addPostFrameCallback(
                              (_) async => animationsMap[
                                      'buttonOnActionTriggerAnimation2']!
                                  .controller
                                  .forward(from: 0.0));
                        }
                        if (FFAppState().isWhiteListUser == true) {
                          await FollowsTable().insert({
                            'created_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                            'follower': null,
                            'whitelist_user_followers': currentUserUid,
                            'whitelist_user': widget!.userID,
                          });
                        } else {
                          await FollowsTable().insert({
                            'created_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                            'follower': currentUserUid,
                            'whitelist_user': widget!.userID,
                            'whitelist_user_followers': null,
                          });
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        'ox8n47vb' /* Follow */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ).animateOnActionTrigger(
                        animationsMap['buttonOnActionTriggerAnimation1']!,
                        hasBeenTriggered: hasButtonTriggered1);
                  } else {
                    return FFButtonWidget(
                      onPressed: () async {
                        _model.isFollow = false;
                        _model.numOfFollower = _model.numOfFollower + -1;
                        setState(() {});
                        if (animationsMap['buttonOnActionTriggerAnimation1'] !=
                            null) {
                          setState(() => hasButtonTriggered1 = true);
                          SchedulerBinding.instance.addPostFrameCallback(
                              (_) async => animationsMap[
                                      'buttonOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0));
                        }
                        if (FFAppState().isWhiteListUser == true) {
                          await FollowsTable().delete(
                            matchingRows: (rows) => rows
                                .eq(
                                  'whitelist_user_followers',
                                  currentUserUid,
                                )
                                .eq(
                                  'whitelist_user',
                                  widget!.userID,
                                ),
                          );
                        } else {
                          await FollowsTable().delete(
                            matchingRows: (rows) => rows
                                .eq(
                                  'follower',
                                  currentUserUid,
                                )
                                .eq(
                                  'whitelist_user',
                                  widget!.userID,
                                ),
                          );
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        'jpekzoka' /* Unfollow */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ).animateOnActionTrigger(
                        animationsMap['buttonOnActionTriggerAnimation2']!,
                        hasBeenTriggered: hasButtonTriggered2);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
