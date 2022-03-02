import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class IndicatorTransactionStatusWidget extends StatefulWidget {
  const IndicatorTransactionStatusWidget({
    Key key,
    this.status,
  }) : super(key: key);

  final String status;

  @override
  _IndicatorTransactionStatusWidgetState createState() =>
      _IndicatorTransactionStatusWidgetState();
}

class _IndicatorTransactionStatusWidgetState
    extends State<IndicatorTransactionStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if ((widget.status) == 'Complete')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0x7F79B473),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                child: Text(
                  'Complete',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Source Sans Pro',
                        color: Color(0xFF388E3C),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        if ((widget.status) == 'Waiting Payment')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF7CEA4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                child: Text(
                  'Waiting payment',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Source Sans Pro',
                        color: Color(0xFFE26D15),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
