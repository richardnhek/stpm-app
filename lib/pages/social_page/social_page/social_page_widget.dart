import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/component/user_post_component/user_post_component_widget.dart';
import '/components/post_shimmer_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_page_model.dart';
export 'social_page_model.dart';

class SocialPageWidget extends StatefulWidget {
  const SocialPageWidget({super.key});

  @override
  State<SocialPageWidget> createState() => _SocialPageWidgetState();
}

class _SocialPageWidgetState extends State<SocialPageWidget> {
  late SocialPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<PostsRow>>(
      future: FFAppState().allPostsQueryCache(
        overrideCache: !loggedIn,
        requestFn: () => PostsTable().queryRows(
          queryFn: (q) => q.order('created_at'),
        ),
      ),
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
        List<PostsRow> socialPagePostsRowList = snapshot.data!;

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: FFAppState().isWhiteListUser == true,
              child: FloatingActionButton(
                onPressed: () async {
                  context.pushNamed(
                    'createPost',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Image.asset(
                            'assets/images/vision-bg.jpeg',
                            width: double.infinity,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'fo1bettm' /* Social */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final listofPost = socialPagePostsRowList.toList();

                        return RefreshIndicator(
                          onRefresh: () async {},
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listofPost.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, listofPostIndex) {
                              final listofPostItem =
                                  listofPost[listofPostIndex];
                              return FutureBuilder<List<WhitelistUsersRow>>(
                                future: _model.postOwnerQueryCache(
                                  uniqueQueryKey:
                                      '${listofPostItem.id.toString()}${listofPostItem.createdAt.toString()}${random_data.randomString(
                                    12,
                                    12,
                                    true,
                                    true,
                                    true,
                                  )} PostOwner',
                                  overrideCache: !loggedIn,
                                  requestFn: () =>
                                      WhitelistUsersTable().querySingleRow(
                                    queryFn: (q) => q.eq(
                                      'id',
                                      listofPostItem.postOwner,
                                    ),
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return PostShimmerComponentWidget();
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
                                    model:
                                        _model.userPostComponentModels.getModel(
                                      '${listofPostItem.id.toString()}${listofPostItem.createdAt.toString()}${random_data.randomString(
                                        12,
                                        12,
                                        true,
                                        true,
                                        true,
                                      )} Post',
                                      listofPostIndex,
                                    ),
                                    updateCallback: () => setState(() {}),
                                    child: UserPostComponentWidget(
                                      key: Key(
                                        'Keyckc_${'${listofPostItem.id.toString()}${listofPostItem.createdAt.toString()}${random_data.randomString(
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
                                      postOwnerId: listofPostItem.postOwner!,
                                      postImg: listofPostItem.contents,
                                      postId: listofPostItem.id,
                                      publishedDate: functions.dateConvention(
                                          listofPostItem.createdAt.toString())!,
                                      postTitle: valueOrDefault<String>(
                                        listofPostItem.title,
                                        'Title',
                                      ),
                                      postDesc: valueOrDefault<String>(
                                        listofPostItem.description,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
