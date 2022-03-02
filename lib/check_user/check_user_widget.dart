import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckUserWidget extends StatefulWidget {
  const CheckUserWidget({Key key}) : super(key: key);

  @override
  _CheckUserWidgetState createState() => _CheckUserWidgetState();
}

class _CheckUserWidgetState extends State<CheckUserWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                      child: Icon(
                        Icons.block,
                        color: FlutterFlowTheme.of(context).platinum,
                        size: 72,
                      ),
                    ),
                    Text(
                      'This user cannot access this app.\nAsk our admin',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Source Sans Pro',
                            color: FlutterFlowTheme.of(context).platinum,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
