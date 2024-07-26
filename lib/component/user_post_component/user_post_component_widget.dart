import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/more_about_post_widget.dart';
import '/components/post_shimmer_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'user_post_component_model.dart';
export 'user_post_component_model.dart';

class UserPostComponentWidget extends StatefulWidget {
  const UserPostComponentWidget({
    super.key,
    this.postOwnerProfileImg,
    required this.postOwnerName,
    this.postOwnerEmail,
    required this.postOwnerId,
    this.postImg,
    required this.postId,
    required this.publishedDate,
    required this.postTitle,
    required this.postDesc,
  });

  final String? postOwnerProfileImg;
  final String? postOwnerName;
  final String? postOwnerEmail;
  final String? postOwnerId;
  final String? postImg;
  final int? postId;
  final String? publishedDate;
  final String? postTitle;
  final String? postDesc;

  @override
  State<UserPostComponentWidget> createState() =>
      _UserPostComponentWidgetState();
}

class _UserPostComponentWidgetState extends State<UserPostComponentWidget>
    with TickerProviderStateMixin {
  late UserPostComponentModel _model;

  var hasIconTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPostComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoaded = false;
      setState(() {});
      _model.allLikesOfPost = await LikesTable().queryRows(
        queryFn: (q) => q.eq(
          'post_id',
          widget!.postId,
        ),
      );
      _model.comments = await CommentsTable().queryRows(
        queryFn: (q) => q.eq(
          'post_id',
          widget!.postId,
        ),
      );
      _model.numOfLikes = _model.allLikesOfPost!.length;
      _model.numOfComments = _model.comments!.length;
      if (FFAppState().isWhiteListUser == true) {
        if ((_model.allLikesOfPost
                        ?.where((e) => e.whitelistUser == currentUserUid)
                        .toList() !=
                    null &&
                (_model.allLikesOfPost
                        ?.where((e) => e.whitelistUser == currentUserUid)
                        .toList())!
                    .isNotEmpty) ==
            true) {
          _model.isLiked = true;
          setState(() {});
        } else {
          _model.isLiked = false;
          setState(() {});
        }

        if ((_model.comments
                        ?.where((e) => e.whitelistsUserId == currentUserUid)
                        .toList() !=
                    null &&
                (_model.comments
                        ?.where((e) => e.whitelistsUserId == currentUserUid)
                        .toList())!
                    .isNotEmpty) ==
            true) {
          _model.isComment = true;
          setState(() {});
        } else {
          _model.isComment = false;
          setState(() {});
        }
      } else {
        if ((_model.allLikesOfPost
                        ?.where((e) => e.userId == currentUserUid)
                        .toList() !=
                    null &&
                (_model.allLikesOfPost
                        ?.where((e) => e.userId == currentUserUid)
                        .toList())!
                    .isNotEmpty) ==
            true) {
          _model.isLiked = true;
          setState(() {});
        } else {
          _model.isLiked = false;
          setState(() {});
        }

        if ((_model.comments
                        ?.where((e) => e.usersId == currentUserUid)
                        .toList() !=
                    null &&
                (_model.comments
                        ?.where((e) => e.usersId == currentUserUid)
                        .toList())!
                    .isNotEmpty) ==
            true) {
          _model.isComment = true;
          setState(() {});
        } else {
          _model.isComment = false;
          setState(() {});
        }
      }

      _model.isLoaded = true;
      setState(() {});
    });

    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 0.0),
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

    return Builder(
      builder: (context) {
        if (_model.isLoaded == true) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (widget!.postOwnerId != currentUserUid) {
                    context.pushNamed(
                      'PublicProfile',
                      queryParameters: {
                        'userID': serializeParam(
                          widget!.postOwnerId,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                        ),
                      },
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: widget!.postOwnerProfileImg!,
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget!.postOwnerName!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (widget!.postOwnerId == currentUserUid)
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: MoreAboutPostWidget(
                                          postID: widget!.postId!,
                                          postOwner: widget!.postOwnerId!,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Icon(
                                Icons.keyboard_control,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (widget!.postImg != null && widget!.postImg != '')
                Container(
                  height: 350.0,
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'postDetail_Page',
                            queryParameters: {
                              'postId': serializeParam(
                                widget!.postId,
                                ParamType.int,
                              ),
                              'posteOwner': serializeParam(
                                widget!.postOwnerId,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        onDoubleTap: () async {
                          if (_model.isLiked == false) {
                            if (animationsMap[
                                    'iconOnActionTriggerAnimation1'] !=
                                null) {
                              animationsMap['iconOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.numOfLikes = _model.numOfLikes + 1;
                            _model.isLiked = true;
                            setState(() {});
                            if (FFAppState().isWhiteListUser == true) {
                              _model.postLikeInsertedRowDoubleTap =
                                  await LikesTable().insert({
                                'post_id': widget!.postId,
                                'created_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'whitelist_user': currentUserUid,
                                'user_id': null,
                              });
                            } else {
                              _model.postLikeInsertedRowUserDoubleTap =
                                  await LikesTable().insert({
                                'post_id': widget!.postId,
                                'created_at': supaSerialize<DateTime>(
                                    getCurrentTimestamp),
                                'user_id': currentUserUid,
                                'whitelist_user': null,
                              });
                            }
                          } else {
                            if (animationsMap[
                                    'iconOnActionTriggerAnimation1'] !=
                                null) {
                              animationsMap['iconOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            if (animationsMap[
                                    'iconOnActionTriggerAnimation2'] !=
                                null) {
                              setState(() => hasIconTriggered2 = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => animationsMap[
                                          'iconOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0));
                            }
                          }

                          setState(() {});
                        },
                        child: FlutterFlowMediaDisplay(
                          path: widget!.postImg!,
                          imageBuilder: (path) => CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 0),
                            fadeOutDuration: Duration(milliseconds: 0),
                            imageUrl: path,
                            width: double.infinity,
                            height: 350.0,
                            fit: BoxFit.cover,
                          ),
                          videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                            path: path,
                            width: double.infinity,
                            height: 350.0,
                            autoPlay: false,
                            looping: false,
                            showControls: false,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.favorite_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 64.0,
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation1']!,
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (_model.isLiked == false) {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isLiked = true;
                                          _model.numOfLikes =
                                              _model.numOfLikes + 1;
                                          setState(() {});
                                          if (animationsMap[
                                                  'iconOnActionTriggerAnimation2'] !=
                                              null) {
                                            setState(
                                                () => hasIconTriggered2 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback(
                                                    (_) async => animationsMap[
                                                            'iconOnActionTriggerAnimation2']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                          if (FFAppState().isWhiteListUser ==
                                              true) {
                                            _model.postLikeInsertedRowDoubleTap2 =
                                                await LikesTable().insert({
                                              'post_id': widget!.postId,
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'whitelist_user': currentUserUid,
                                              'user_id': null,
                                            });
                                          } else {
                                            _model.postLikeInsertedRowUserDoubleTap2 =
                                                await LikesTable().insert({
                                              'post_id': widget!.postId,
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                              'user_id': currentUserUid,
                                              'whitelist_user': null,
                                            });
                                          }

                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isLiked = false;
                                          _model.numOfLikes =
                                              _model.numOfLikes + -1;
                                          setState(() {});
                                          if (FFAppState().isWhiteListUser ==
                                              true) {
                                            await LikesTable().delete(
                                              matchingRows: (rows) => rows
                                                  .eq(
                                                    'post_id',
                                                    widget!.postId,
                                                  )
                                                  .eq(
                                                    'whitelist_user',
                                                    currentUserUid,
                                                  ),
                                            );
                                          } else {
                                            await LikesTable().delete(
                                              matchingRows: (rows) => rows
                                                  .eq(
                                                    'post_id',
                                                    widget!.postId,
                                                  )
                                                  .eq(
                                                    'user_id',
                                                    currentUserUid,
                                                  ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 25.0,
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconOnActionTriggerAnimation2']!,
                                          hasBeenTriggered: hasIconTriggered2);
                                    }
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    _model.numOfLikes.toString(),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'postDetail_Page',
                                queryParameters: {
                                  'postId': serializeParam(
                                    widget!.postId,
                                    ParamType.int,
                                  ),
                                  'posteOwner': serializeParam(
                                    widget!.postOwnerId,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 800),
                                  ),
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (_model.isComment == false) {
                                      return Icon(
                                        Icons.mode_comment_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.mode_comment_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    _model.numOfComments.toString(),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: false,
                            child: Icon(
                              Icons.ios_share,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 4.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 8.0),
                              child: Text(
                                widget!.publishedDate!,
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelSmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 6.0),
                              child: Text(
                                widget!.postTitle!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Text(
                                widget!.postDesc!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: Color(0x8D000000),
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return wrapWithModel(
            model: _model.postShimmerComponentModel,
            updateCallback: () => setState(() {}),
            child: PostShimmerComponentWidget(),
          );
        }
      },
    );
  }
}
