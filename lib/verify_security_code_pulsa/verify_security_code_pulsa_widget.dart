import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifySecurityCodePulsaWidget extends StatefulWidget {
  const VerifySecurityCodePulsaWidget({Key key}) : super(key: key);

  @override
  _VerifySecurityCodePulsaWidgetState createState() =>
      _VerifySecurityCodePulsaWidgetState();
}

class _VerifySecurityCodePulsaWidgetState
    extends State<VerifySecurityCodePulsaWidget> with TickerProviderStateMixin {
  TextEditingController securityCodeController;
  bool securityCodeVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 600,
      initialState: AnimationState(
        offset: Offset(-28, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    securityCodeController = TextEditingController();
    securityCodeVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).oxfordBlue,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<List<UsersRecord>>(
            future: queryUsersRecordOnce(
              queryBuilder: (usersRecord) =>
                  usersRecord.where('uid', isEqualTo: currentUserUid),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitFadingFour(
                      color: FlutterFlowTheme.of(context).orangePeel,
                      size: 50,
                    ),
                  ),
                );
              }
              List<UsersRecord> stackUsersRecordList = snapshot.data;
              final stackUsersRecord = stackUsersRecordList.isNotEmpty
                  ? stackUsersRecordList.first
                  : null;
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your security code',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Source Sans Pro',
                                color: FlutterFlowTheme.of(context).platinum,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Security Code',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Source Sans Pro',
                                      color:
                                          FlutterFlowTheme.of(context).platinum,
                                    ),
                              ),
                              TextFormField(
                                controller: securityCodeController,
                                obscureText: !securityCodeVisibility,
                                decoration: InputDecoration(
                                  hintText: 'Insert your email',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        color: Color(0xFFA9A9A9),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  filled: true,
                                  fillColor:
                                      FlutterFlowTheme.of(context).platinum,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => securityCodeVisibility =
                                          !securityCodeVisibility,
                                    ),
                                    child: Icon(
                                      securityCodeVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Source Sans Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .eerieBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ).animated([
                            animationsMap['columnOnActionTriggerAnimation']
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              if ((stackUsersRecord.securityCode) !=
                                  (securityCodeController.text)) {
                                await (animationsMap[
                                            'columnOnActionTriggerAnimation']
                                        .curvedAnimation
                                        .parent as AnimationController)
                                    .forward(from: 0.0);
                              }
                              if ((stackUsersRecord.securityCode) ==
                                  (securityCodeController.text)) {
                                setState(() =>
                                    FFAppState().isSecurityCodeVerified = true);
                              } else {
                                return;
                              }
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 44,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).orangePeel,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 4, 0),
                                    child: Icon(
                                      Icons.shield,
                                      color:
                                          FlutterFlowTheme.of(context).platinum,
                                      size: 18,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Confirm',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Source Sans Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .cultured3,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
