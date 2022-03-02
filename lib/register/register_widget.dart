import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import '../verify_phone_number/verify_phone_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController emailController;
  TextEditingController fullnameController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    fullnameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).oxfordBlue,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
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
                              'Fullname (Based on your ID Card)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).platinum,
                                  ),
                            ),
                            TextFormField(
                              controller: fullnameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Your name',
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).eerieBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Field is required';
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).platinum,
                                  ),
                            ),
                            TextFormField(
                              controller: emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Your email',
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
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).eerieBlack,
                                    fontWeight: FontWeight.bold,
                                  ),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Field is required';
                                }

                                return null;
                              },
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                              child: Text(
                                'We use this email for sending invoices and other promotions',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Source Sans Pro',
                                      color:
                                          FlutterFlowTheme.of(context).platinum,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Your data is secured. ',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Source Sans Pro',
                                  color: FlutterFlowTheme.of(context).platinum,
                                  lineHeight: 3,
                                ),
                          ),
                          Text(
                            'Read privacy policy',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Source Sans Pro',
                                  color:
                                      FlutterFlowTheme.of(context).pewterBlue,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 3,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (!formKey.currentState.validate()) {
                              return;
                            }

                            setState(() => FFAppState().fullName =
                                fullnameController.text);
                            setState(() =>
                                FFAppState().email = emailController.text);
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyPhoneNumberWidget(),
                              ),
                              (r) => false,
                            );
                          },
                          text: 'Submit',
                          icon: Icon(
                            Icons.shield,
                            size: 18,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44,
                            color: FlutterFlowTheme.of(context).orangePeel,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Source Sans Pro',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 4,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Already have account? ',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Source Sans Pro',
                                  color: FlutterFlowTheme.of(context).platinum,
                                  lineHeight: 3,
                                ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginWidget(),
                                ),
                              );
                            },
                            child: Text(
                              'Login instead',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).pewterBlue,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 3,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
