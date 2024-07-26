import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/component/user_post_component/user_post_component_widget.dart';
import '/components/public_profile_components_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'public_profile_model.dart';
export 'public_profile_model.dart';

class PublicProfileWidget extends StatefulWidget {
  const PublicProfileWidget({
    super.key,
    required this.userID,
  });

  final String? userID;

  @override
  State<PublicProfileWidget> createState() => _PublicProfileWidgetState();
}

class _PublicProfileWidgetState extends State<PublicProfileWidget> {
  late PublicProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicProfileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WhitelistUsersRow>>(
      future: (_model.requestCompleter ??= Completer<List<WhitelistUsersRow>>()
            ..complete(WhitelistUsersTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                widget!.userID,
              ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<WhitelistUsersRow> publicProfileWhitelistUsersRowList =
            snapshot.data!;

        final publicProfileWhitelistUsersRow =
            publicProfileWhitelistUsersRowList.isNotEmpty
                ? publicProfileWhitelistUsersRowList.first
                : null;

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                buttonSize: 46.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 25.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 870.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 12.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 2.0, 0.0, 2.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.home_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Icon(
                                              Icons.chevron_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    's7i78yby' /* Page Title */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Icon(
                                              Icons.chevron_right_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 16.0, 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vnhgiyto' /* Page Details */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              wrapWithModel(
                                model: _model.publicProfileComponentsModel,
                                updateCallback: () => setState(() {}),
                                child: PublicProfileComponentsWidget(
                                  photoUrl:
                                      publicProfileWhitelistUsersRow?.photoUrl,
                                  displayName: publicProfileWhitelistUsersRow
                                      ?.displayName,
                                  email: publicProfileWhitelistUsersRow?.email,
                                  bio: publicProfileWhitelistUsersRow?.bio,
                                  userID: widget!.userID!,
                                ),
                              ),
                              Expanded(
                                child: FutureBuilder<List<PostsRow>>(
                                  future: FFAppState().allPostsQueryCache(
                                    uniqueQueryKey: valueOrDefault<String>(
                                      widget!.userID,
                                      '0',
                                    ),
                                    overrideCache: !loggedIn,
                                    requestFn: () => PostsTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'post_owner',
                                            publicProfileWhitelistUsersRow?.id,
                                          )
                                          .order('created_at'),
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostsRow> containerPostsRowList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final postList =
                                              containerPostsRowList.toList();

                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              setState(() => _model
                                                  .requestCompleter = null);
                                              await _model
                                                  .waitForRequestCompleted(
                                                      minWait: 200,
                                                      maxWait: 5000);
                                            },
                                            child: ListView.separated(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: postList.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 10.0),
                                              itemBuilder:
                                                  (context, postListIndex) {
                                                final postListItem =
                                                    postList[postListIndex];
                                                return FutureBuilder<
                                                    List<WhitelistUsersRow>>(
                                                  future: _model
                                                      .postInPublicProfile(
                                                    uniqueQueryKey:
                                                        '${postListItem.id.toString()}${postListItem.createdAt.toString()}${random_data.randomString(
                                                      12,
                                                      12,
                                                      true,
                                                      true,
                                                      true,
                                                    )} PostOwner',
                                                    overrideCache: !loggedIn,
                                                    requestFn: () =>
                                                        WhitelistUsersTable()
                                                            .querySingleRow(
                                                      queryFn: (q) => q.eq(
                                                        'id',
                                                        postListItem.postOwner,
                                                      ),
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<WhitelistUsersRow>
                                                        userPostComponentWhitelistUsersRowList =
                                                        snapshot.data!;

                                                    final userPostComponentWhitelistUsersRow =
                                                        userPostComponentWhitelistUsersRowList
                                                                .isNotEmpty
                                                            ? userPostComponentWhitelistUsersRowList
                                                                .first
                                                            : null;

                                                    return wrapWithModel(
                                                      model: _model
                                                          .userPostComponentModels
                                                          .getModel(
                                                        '${postListItem.id.toString()}${postListItem.createdAt.toString()}${random_data.randomString(
                                                          12,
                                                          12,
                                                          true,
                                                          true,
                                                          true,
                                                        )} Post',
                                                        postListIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          UserPostComponentWidget(
                                                        key: Key(
                                                          'Keyy69_${'${postListItem.id.toString()}${postListItem.createdAt.toString()}${random_data.randomString(
                                                            12,
                                                            12,
                                                            true,
                                                            true,
                                                            true,
                                                          )} Post'}',
                                                        ),
                                                        postOwnerProfileImg:
                                                            userPostComponentWhitelistUsersRow
                                                                ?.photoUrl,
                                                        postOwnerName:
                                                            userPostComponentWhitelistUsersRow!
                                                                .displayName!,
                                                        postOwnerEmail:
                                                            userPostComponentWhitelistUsersRow
                                                                ?.email,
                                                        postOwnerId:
                                                            postListItem
                                                                .postOwner!,
                                                        postImg: postListItem
                                                            .contents,
                                                        postId: postListItem.id,
                                                        publishedDate:
                                                            valueOrDefault<
                                                                String>(
                                                          functions.dateConvention(
                                                              postListItem
                                                                  .createdAt
                                                                  .toString()),
                                                          '0',
                                                        ),
                                                        postTitle:
                                                            valueOrDefault<
                                                                String>(
                                                          postListItem.title,
                                                          'Title',
                                                        ),
                                                        postDesc:
                                                            valueOrDefault<
                                                                String>(
                                                          postListItem
                                                              .description,
                                                          'Description',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
