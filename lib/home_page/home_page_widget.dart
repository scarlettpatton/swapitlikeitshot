import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  PageController? pageViewController;
  String? choiceChipsValue;
  late SwipeableCardSectionController swipeableStackController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final usersUpdateData = {
        'filterColor': FieldValue.delete(),
        'filterSize': FieldValue.delete(),
      };
      await currentUserReference!.update(usersUpdateData);
    });

    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                child: Text(
                  'Swap It!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('filter');
                    },
                    child: Icon(
                      Icons.filter_alt,
                      color: Color(0xFFF1F4F8),
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: AuthUserStreamWidget(
                    child: StreamBuilder<List<PostsRecord>>(
                      stream: queryPostsRecord(
                        queryBuilder: (postsRecord) => postsRecord
                            .where('color',
                                arrayContains: valueOrDefault(
                                            currentUserDocument?.filterColor,
                                            '') !=
                                        ''
                                    ? valueOrDefault(
                                        currentUserDocument?.filterColor, '')
                                    : null)
                            .where('size',
                                isEqualTo: valueOrDefault(
                                            currentUserDocument?.filterSize,
                                            '') !=
                                        ''
                                    ? valueOrDefault(
                                        currentUserDocument?.filterSize, '')
                                    : null)
                            .where('uid',
                                isNotEqualTo: currentUserUid != ''
                                    ? currentUserUid
                                    : null),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<PostsRecord> swipeableStackPostsRecordList =
                            snapshot.data!;
                        return FlutterFlowSwipeableStack(
                          topCardHeightFraction: 0.72,
                          middleCardHeightFraction: 0.68,
                          botttomCardHeightFraction: 0.75,
                          topCardWidthFraction: 0.9,
                          middleCardWidthFraction: 0.85,
                          botttomCardWidthFraction: 0.8,
                          onSwipeFn: (index) {},
                          onLeftSwipe: (index) {},
                          onRightSwipe: (index) {},
                          onUpSwipe: (index) {},
                          onDownSwipe: (index) {},
                          itemBuilder: (context, swipeableStackIndex) {
                            final swipeableStackPostsRecord =
                                swipeableStackPostsRecordList[
                                    swipeableStackIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                              child: StreamBuilder<List<PostsRecord>>(
                                stream: queryPostsRecord(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostsRecord> travelCardPostsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final travelCardPostsRecord =
                                      travelCardPostsRecordList.isNotEmpty
                                          ? travelCardPostsRecordList.first
                                          : null;
                                  return Container(
                                    width: double.infinity,
                                    height: 600,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0x230F1113),
                                          offset: Offset(0, 4),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      onDoubleTap: () async {
                                        swipeableStackController
                                            .triggerSwipeRight();

                                        final usersUpdateData = {
                                          'likedPosts': FieldValue.arrayUnion([
                                            travelCardPostsRecord!.reference
                                          ]),
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);

                                        context.pushNamed(
                                          'inviteUser',
                                          queryParams: {
                                            'item': serializeParam(
                                              travelCardPostsRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'item': travelCardPostsRecord,
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final photos =
                                                  swipeableStackPostsRecord
                                                      .photos!
                                                      .toList();
                                              return Container(
                                                width: double.infinity,
                                                height: 300,
                                                child: Stack(
                                                  children: [
                                                    PageView.builder(
                                                      controller:
                                                          pageViewController ??=
                                                              PageController(
                                                                  initialPage: min(
                                                                      0,
                                                                      photos.length -
                                                                          1)),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: photos.length,
                                                      itemBuilder: (context,
                                                          photosIndex) {
                                                        final photosItem =
                                                            photos[photosIndex];
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                          child: Image.network(
                                                            photosItem,
                                                            width:
                                                                double.infinity,
                                                            height: 60,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 1),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 10),
                                                        child: smooth_page_indicator
                                                            .SmoothPageIndicator(
                                                          controller: pageViewController ??=
                                                              PageController(
                                                                  initialPage: min(
                                                                      0,
                                                                      photos.length -
                                                                          1)),
                                                          count: photos.length,
                                                          axisDirection:
                                                              Axis.horizontal,
                                                          onDotClicked: (i) {
                                                            pageViewController!
                                                                .animateToPage(
                                                              i,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          effect: smooth_page_indicator
                                                              .ExpandingDotsEffect(
                                                            expansionFactor: 2,
                                                            spacing: 8,
                                                            radius: 16,
                                                            dotWidth: 10,
                                                            dotHeight: 10,
                                                            dotColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                            activeDotColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                            paintStyle:
                                                                PaintingStyle
                                                                    .fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 12, 16, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      swipeableStackPostsRecord
                                                          .name!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF0492C2),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 80,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFCECECE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 2, 0, 0),
                                                    child: Text(
                                                      swipeableStackPostsRecord
                                                          .size!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 6, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              swipeableStackPostsRecord
                                                                  .information!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 5, 15, 0),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options:
                                                            swipeableStackPostsRecord
                                                                .color!
                                                                .toList()
                                                                .map((label) =>
                                                                    ChipData(
                                                                        label))
                                                                .toList(),
                                                        onChanged: (val) =>
                                                            setState(() =>
                                                                choiceChipsValue =
                                                                    val?.first),
                                                        selectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              Color(0xFFFA8128),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          iconColor:
                                                              Colors.white,
                                                          iconSize: 18,
                                                          elevation: 4,
                                                        ),
                                                        unselectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                  ),
                                                          iconColor:
                                                              Color(0xFF323B45),
                                                          iconSize: 18,
                                                          elevation: 4,
                                                        ),
                                                        chipSpacing: 20,
                                                        multiselect: false,
                                                        alignment:
                                                            WrapAlignment.start,
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
                                  );
                                },
                              ),
                            );
                          },
                          itemCount: swipeableStackPostsRecordList.length,
                          controller: swipeableStackController,
                          enableSwipeUp: false,
                          enableSwipeDown: false,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: FlutterFlowAdBanner(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  showsTestAd: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
