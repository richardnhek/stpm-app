import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_news_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isInitialAppLoad == false) {
        _model.isLoaded = false;
        setState(() {});
        _model.thisUserUid = await actions.getCurrentUserUid();
        FFAppState().thisUserUid = _model.thisUserUid!;
        FFAppState().update(() {});
        _model.selectedWhiteListUser = await WhitelistUsersTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            _model.thisUserUid,
          ),
        );
        _model.selectedUser = await UsersTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            _model.thisUserUid,
          ),
        );
        if (!((_model.selectedUser != null && (_model.selectedUser)!.isNotEmpty
                ? (_model.selectedUser?.first?.isProfileCreated == true)
                : false) ||
            (_model.selectedWhiteListUser != null &&
                    (_model.selectedWhiteListUser)!.isNotEmpty
                ? (_model.selectedWhiteListUser?.first?.isProfileCreated ==
                    true)
                : false))) {
          context.goNamed('EditProfileRefine');

          return;
        }
        if (_model.selectedWhiteListUser != null &&
            (_model.selectedWhiteListUser)!.isNotEmpty) {
          FFAppState().isWhiteListUser = true;
          FFAppState().update(() {});
        } else {
          FFAppState().isWhiteListUser = false;
          FFAppState().update(() {});
        }

        if (!(FFAppState().publicKey != null && FFAppState().publicKey != '')) {
          FFAppState().publicKey =
              '338fceba2a8873a4adc572f7b00042be7c6b5ee155bccf0a741b91d76091a37c24dd43cf3dc789f84050f21dcb4335a0ac0294b40bfd42ab516a64115593973ca110c0c9a886a16779111a0e927b95f1317b5758d953d253b8fe7a3786785a473b0d0a096620b02efca55bc723b6fd8fd3df661b19ed20c57fddf735e9b87b49';
          FFAppState().update(() {});
        }
        _model.isLoaded = true;
        setState(() {});
        FFAppState().isInitialAppLoad = true;
        FFAppState().update(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Builder(
        builder: (context) {
          if (_model.isLoaded == true) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    Image.asset(
                      'assets/images/vision-bg.jpeg',
                      width: double.infinity,
                      height: 165.0,
                      fit: BoxFit.cover,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 165.0,
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.49),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/angkor-wat.png',
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/hero.png',
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        FFLocalizations.of(context).getText(
                                          'qbbm0we8' /* សម្តេចមហាបវរធិបតី ហ៊ុន ម៉ាណែត */,
                                        ),
                                        minFontSize: 10.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Moulpali',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Moulpali'),
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '3gidbe6l' /* នាយករដ្ឋមន្ត្រី នៃព្រះរាជាណាចក... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Moul',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Moul'),
                                            ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                FutureBuilder<ApiCallResponse>(
                  future: STPMAPICallGroupGroup.sTPMEventsCall.call(
                    lang: FFLocalizations.of(context).languageCode == 'en'
                        ? 'en'
                        : 'km',
                    pageSize: 5,
                    publicKey: FFAppState().publicKey,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final columnSTPMEventsResponse = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final allFeeds = (getJsonField(
                                  columnSTPMEventsResponse.jsonBody,
                                  r'''$.data''',
                                  true,
                                )
                                        ?.toList()
                                        .map<NewsItemStruct?>(
                                            NewsItemStruct.maybeFromMap)
                                        .toList() as Iterable<NewsItemStruct?>)
                                    .withoutNulls
                                    ?.where((e) =>
                                        e.attributes.category.data != null
                                            ? ((e.attributes.category.data
                                                        .attributes.name ==
                                                    'Top') ||
                                                (e.attributes.category.data
                                                        .attributes.name ==
                                                    'ថប'))
                                            : false)
                                    .toList()
                                    ?.toList() ??
                                [];
                            if (allFeeds.isEmpty) {
                              return Center(
                                child: Container(
                                  height: 180.0,
                                  child: EmptyNewsComponentWidget(),
                                ),
                              );
                            }

                            return Container(
                              width: double.infinity,
                              height: 180.0,
                              child: CarouselSlider.builder(
                                itemCount: allFeeds.length,
                                itemBuilder: (context, allFeedsIndex, _) {
                                  final allFeedsItem = allFeeds[allFeedsIndex];
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'NewsDetail',
                                          queryParameters: {
                                            'newsTitle': serializeParam(
                                              allFeedsItem.attributes.title,
                                              ParamType.String,
                                            ),
                                            'newsDescription': serializeParam(
                                              allFeedsItem
                                                  .attributes.description,
                                              ParamType.String,
                                            ),
                                            'newsImage': serializeParam(
                                              'https://1.demo.hunmanet.kh/${allFeedsItem.attributes.formats.large.url}',
                                              ParamType.String,
                                            ),
                                            'newsPublishedAt': serializeParam(
                                              functions.formatDateString(
                                                  allFeedsItem
                                                      .attributes.publishedAt),
                                              ParamType.String,
                                            ),
                                            'newsType': serializeParam(
                                              'Feed',
                                              ParamType.String,
                                            ),
                                            'newsId': serializeParam(
                                              allFeedsItem.id,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 180.0,
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    'https://1.demo.hunmanet.kh${() {
                                                  if (allFeedsItem
                                                              .attributes
                                                              .thumbnail
                                                              .data
                                                              .first
                                                              .attributes
                                                              .formats
                                                              .large
                                                              .url !=
                                                          null &&
                                                      allFeedsItem
                                                              .attributes
                                                              .thumbnail
                                                              .data
                                                              .first
                                                              .attributes
                                                              .formats
                                                              .large
                                                              .url !=
                                                          '') {
                                                    return allFeedsItem
                                                        .attributes
                                                        .thumbnail
                                                        .data
                                                        .first
                                                        .attributes
                                                        .formats
                                                        .large
                                                        .url;
                                                  } else if (allFeedsItem
                                                              .attributes
                                                              .thumbnail
                                                              .data
                                                              .first
                                                              .attributes
                                                              .formats
                                                              .medium
                                                              .url !=
                                                          null &&
                                                      allFeedsItem
                                                              .attributes
                                                              .thumbnail
                                                              .data
                                                              .first
                                                              .attributes
                                                              .formats
                                                              .medium
                                                              .url !=
                                                          '') {
                                                    return allFeedsItem
                                                        .attributes
                                                        .thumbnail
                                                        .data
                                                        .first
                                                        .attributes
                                                        .formats
                                                        .medium
                                                        .url;
                                                  } else {
                                                    return allFeedsItem
                                                        .attributes
                                                        .thumbnail
                                                        .data
                                                        .first
                                                        .attributes
                                                        .url;
                                                  }
                                                }()}',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                  alignment:
                                                      Alignment(0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xCCE31E2C),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    allFeedsItem
                                                        .attributes.title
                                                        .maybeHandleOverflow(
                                                      maxChars: 50,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Montserrat'),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselController(),
                                options: CarouselOptions(
                                  initialPage:
                                      max(0, min(1, allFeeds.length - 1)),
                                  viewportFraction: 1.0,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayInterval:
                                      Duration(milliseconds: (800 + 3000)),
                                  autoPlayCurve: Curves.linear,
                                  pauseAutoPlayInFiniteScroll: true,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: FFAppState().allAnnouncements(
                                requestFn: () => STPMAPICallGroupGroup
                                    .sTPMAnnouncementsCall
                                    .call(
                                  lang: FFLocalizations.of(context)
                                              .languageCode ==
                                          'en'
                                      ? 'en'
                                      : 'km',
                                  pageSize: 4,
                                  publicKey: FFAppState().publicKey,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final scrollingTextWidgetSTPMAnnouncementsResponse =
                                    snapshot.data!;

                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 25.0,
                                  child: custom_widgets.ScrollingTextWidget(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 25.0,
                                    jsonBody:
                                        scrollingTextWidgetSTPMAnnouncementsResponse
                                            .jsonBody,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                if (false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 25.0, 10.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 2.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'vzttds5r' /* Search latest news, announceme... */,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 0.0,
                              buttonSize: 40.0,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.arrow_forward_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primary,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).tertiary,
                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          labelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                          unselectedLabelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          indicatorWeight: 2.5,
                          padding: EdgeInsets.all(4.0),
                          tabs: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.campaign_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'm5x8qyie' /* Announcements */,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.text_snippet_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '4a82si37' /* Other Events */,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            KeepAliveWidgetWrapper(
                              builder: (context) =>
                                  FutureBuilder<ApiCallResponse>(
                                future: FFAppState().allAnnouncements(
                                  requestFn: () => STPMAPICallGroupGroup
                                      .sTPMAnnouncementsCall
                                      .call(
                                    lang: FFLocalizations.of(context)
                                                .languageCode ==
                                            'en'
                                        ? 'en'
                                        : 'km',
                                    pageSize: 4,
                                    publicKey: FFAppState().publicKey,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnSTPMAnnouncementsResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final announcementData = getJsonField(
                                        columnSTPMAnnouncementsResponse
                                            .jsonBody,
                                        r'''$.data''',
                                      ).toList().take(30).toList();
                                      if (announcementData.isEmpty) {
                                        return EmptyNewsComponentWidget();
                                      }

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                                  announcementData.length,
                                                  (announcementDataIndex) {
                                            final announcementDataItem =
                                                announcementData[
                                                    announcementDataIndex];
                                            return Visibility(
                                              visible: getJsonField(
                                                    announcementDataItem,
                                                    r'''$.attributes''',
                                                  ) !=
                                                  null,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'NewsDetail',
                                                      queryParameters: {
                                                        'newsTitle':
                                                            serializeParam(
                                                          getJsonField(
                                                            announcementDataItem,
                                                            r'''$.attributes.Title''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'newsDescription':
                                                            serializeParam(
                                                          getJsonField(
                                                            announcementDataItem,
                                                            r'''$.attributes.Content''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'newsImage':
                                                            serializeParam(
                                                          'https://1.demo.hunmanet.kh/${getJsonField(
                                                            announcementDataItem,
                                                            r'''$.attributes.Image.data[0].attributes.formats.large.url''',
                                                          ).toString()}',
                                                          ParamType.String,
                                                        ),
                                                        'newsPublishedAt':
                                                            serializeParam(
                                                          functions
                                                              .formatDateString(
                                                                  getJsonField(
                                                            announcementDataItem,
                                                            r'''$.attributes.publishedAt''',
                                                          ).toString()),
                                                          ParamType.String,
                                                        ),
                                                        'newsType':
                                                            serializeParam(
                                                          'Announcement',
                                                          ParamType.String,
                                                        ),
                                                        'newsId':
                                                            serializeParam(
                                                          getJsonField(
                                                            announcementDataItem,
                                                            r'''$.id''',
                                                          ),
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      height: 130.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    'https://1.demo.hunmanet.kh/${getJsonField(
                                                                  announcementDataItem,
                                                                  r'''$.attributes.Image.data[0].attributes.formats.large.url''',
                                                                ).toString()}',
                                                                width: 125.0,
                                                                height: 110.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 125.0,
                                                                  height: 110.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          getJsonField(
                                                                            announcementDataItem,
                                                                            r'''$.attributes.Title''',
                                                                          ).toString().maybeHandleOverflow(
                                                                                maxChars: 32,
                                                                                replacement: '…',
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            announcementDataItem,
                                                                            r'''$.attributes.Content''',
                                                                          ).toString().maybeHandleOverflow(
                                                                                maxChars: 36,
                                                                                replacement: '…',
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      Text(
                                                                        functions
                                                                            .formatDateString(getJsonField(
                                                                              announcementDataItem,
                                                                              r'''$.attributes.publishedAt''',
                                                                            ).toString())
                                                                            .maybeHandleOverflow(
                                                                              maxChars: 60,
                                                                              replacement: '…',
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            5.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                              .divide(
                                                SizedBox(height: 10.0),
                                                filterFn:
                                                    (announcementDataIndex) {
                                                  final announcementDataItem =
                                                      announcementData[
                                                          announcementDataIndex];
                                                  return getJsonField(
                                                        announcementDataItem,
                                                        r'''$.attributes''',
                                                      ) !=
                                                      null;
                                                },
                                              )
                                              .addToStart(
                                                  SizedBox(height: 10.0))
                                              .addToEnd(SizedBox(height: 10.0)),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) =>
                                  FutureBuilder<ApiCallResponse>(
                                future:
                                    STPMAPICallGroupGroup.sTPMEventsCall.call(
                                  lang: FFLocalizations.of(context)
                                              .languageCode ==
                                          'en'
                                      ? 'en'
                                      : 'km',
                                  pageSize: 4,
                                  publicKey: FFAppState().publicKey,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final columnSTPMEventsResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final feedData = ((getJsonField(
                                                columnSTPMEventsResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                                true,
                                              )
                                                          ?.toList()
                                                          .map<NewsItemStruct?>(
                                                              NewsItemStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          NewsItemStruct?>)
                                                  .withoutNulls
                                                  ?.toList() ??
                                              [])
                                          .take(30)
                                          .toList();
                                      if (feedData.isEmpty) {
                                        return EmptyNewsComponentWidget();
                                      }

                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                                  feedData.length,
                                                  (feedDataIndex) {
                                            final feedDataItem =
                                                feedData[feedDataIndex];
                                            return Visibility(
                                              visible:
                                                  feedDataItem.attributes !=
                                                      null,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'NewsDetail',
                                                      queryParameters: {
                                                        'newsTitle':
                                                            serializeParam(
                                                          feedDataItem
                                                              .attributes.title,
                                                          ParamType.String,
                                                        ),
                                                        'newsDescription':
                                                            serializeParam(
                                                          feedDataItem
                                                              .attributes
                                                              .description,
                                                          ParamType.String,
                                                        ),
                                                        'newsImage':
                                                            serializeParam(
                                                          'https://1.demo.hunmanet.kh${() {
                                                            if (feedDataItem
                                                                        .attributes
                                                                        .thumbnail
                                                                        .data
                                                                        .first
                                                                        .attributes
                                                                        .formats
                                                                        .large
                                                                        .url !=
                                                                    null &&
                                                                feedDataItem
                                                                        .attributes
                                                                        .thumbnail
                                                                        .data
                                                                        .first
                                                                        .attributes
                                                                        .formats
                                                                        .large
                                                                        .url !=
                                                                    '') {
                                                              return feedDataItem
                                                                  .attributes
                                                                  .thumbnail
                                                                  .data
                                                                  .first
                                                                  .attributes
                                                                  .formats
                                                                  .large
                                                                  .url;
                                                            } else if (feedDataItem
                                                                        .attributes
                                                                        .thumbnail
                                                                        .data
                                                                        .first
                                                                        .attributes
                                                                        .formats
                                                                        .medium
                                                                        .url !=
                                                                    null &&
                                                                feedDataItem
                                                                        .attributes
                                                                        .thumbnail
                                                                        .data
                                                                        .first
                                                                        .attributes
                                                                        .formats
                                                                        .medium
                                                                        .url !=
                                                                    '') {
                                                              return (feedDataItem
                                                                              .attributes
                                                                              .thumbnail
                                                                              .data
                                                                              .first
                                                                              .attributes
                                                                              .formats
                                                                              .medium
                                                                              .url !=
                                                                          null &&
                                                                      feedDataItem
                                                                              .attributes
                                                                              .thumbnail
                                                                              .data
                                                                              .first
                                                                              .attributes
                                                                              .formats
                                                                              .medium
                                                                              .url !=
                                                                          '')
                                                                  .toString();
                                                            } else {
                                                              return feedDataItem
                                                                  .attributes
                                                                  .thumbnail
                                                                  .data
                                                                  .first
                                                                  .attributes
                                                                  .url;
                                                            }
                                                          }()}',
                                                          ParamType.String,
                                                        ),
                                                        'newsPublishedAt':
                                                            serializeParam(
                                                          functions.formatDateString(
                                                              feedDataItem
                                                                  .attributes
                                                                  .publishedAt),
                                                          ParamType.String,
                                                        ),
                                                        'newsType':
                                                            serializeParam(
                                                          'Event',
                                                          ParamType.String,
                                                        ),
                                                        'newsId':
                                                            serializeParam(
                                                          feedDataItem.id,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    'https://1.demo.hunmanet.kh${() {
                                                                  if (feedDataItem
                                                                              .attributes
                                                                              .thumbnail
                                                                              .data
                                                                              .first
                                                                              .attributes
                                                                              .formats
                                                                              .large
                                                                              .url !=
                                                                          null &&
                                                                      feedDataItem
                                                                              .attributes
                                                                              .thumbnail
                                                                              .data
                                                                              .first
                                                                              .attributes
                                                                              .formats
                                                                              .large
                                                                              .url !=
                                                                          '') {
                                                                    return feedDataItem
                                                                        .attributes
                                                                        .thumbnail
                                                                        .data
                                                                        .first
                                                                        .attributes
                                                                        .formats
                                                                        .large
                                                                        .url;
                                                                  } else if (feedDataItem
                                                                              .attributes
                                                                              .thumbnail
                                                                              .data
                                                                              .first
                                                                              .attributes
                                                                              .formats
                                                                              .medium
                                                                              .url !=
                                                                          null &&
                                                                      feedDataItem
                                                                              .attributes
                                                                              .thumbnail
                                                                              .data
                                                                              .first
                                                                              .attributes
                                                                              .formats
                                                                              .medium
                                                                              .url !=
                                                                          '') {
                                                                    return (feedDataItem.attributes.thumbnail.data.first.attributes.formats.medium.url !=
                                                                                null &&
                                                                            feedDataItem.attributes.thumbnail.data.first.attributes.formats.medium.url !=
                                                                                '')
                                                                        .toString();
                                                                  } else {
                                                                    return feedDataItem
                                                                        .attributes
                                                                        .thumbnail
                                                                        .data
                                                                        .first
                                                                        .attributes
                                                                        .url;
                                                                  }
                                                                }()}',
                                                                width: 125.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorWidget: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  width: 125.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          feedDataItem
                                                                              .attributes
                                                                              .title
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                32,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          feedDataItem
                                                                              .attributes
                                                                              .description
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                36,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      Text(
                                                                        functions
                                                                            .formatDateString(feedDataItem.attributes.publishedAt)
                                                                            .maybeHandleOverflow(
                                                                              maxChars: 60,
                                                                              replacement: '…',
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            5.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })
                                              .divide(
                                                SizedBox(height: 10.0),
                                                filterFn: (feedDataIndex) {
                                                  final feedDataItem =
                                                      feedData[feedDataIndex];
                                                  return feedDataItem
                                                          .attributes !=
                                                      null;
                                                },
                                              )
                                              .addToStart(
                                                  SizedBox(height: 10.0))
                                              .addToEnd(SizedBox(height: 10.0)),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.selectedNewsType = '';
                            setState(() {});
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            _model.selectedNewsType = 'announcements';
                            setState(() {});
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'wras4997' /* Announcements */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: valueOrDefault<Color>(
                                    _model.selectedNewsType == 'announcements'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Montserrat'),
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.selectedNewsType = '';
                            setState(() {});
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            _model.selectedNewsType = 'events';
                            setState(() {});
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kb2oilf2' /* Events */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: valueOrDefault<Color>(
                                    _model.selectedNewsType == 'events'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Montserrat'),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          } else {
            return Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 75.0,
                height: 75.0,
                child: custom_widgets.FFlowSpinner(
                  width: 75.0,
                  height: 75.0,
                  spinnerWidth: 50.0,
                  spinnerHeight: 50.0,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  spinnerColor: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
