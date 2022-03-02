import '../backend/backend.dart';
import '../components/indicator_transaction_status_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTransactionRowWidget extends StatefulWidget {
  const ListTransactionRowWidget({
    Key key,
    this.transaction,
  }) : super(key: key);

  final TransactionRecord transaction;

  @override
  _ListTransactionRowWidgetState createState() =>
      _ListTransactionRowWidgetState();
}

class _ListTransactionRowWidgetState extends State<ListTransactionRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if ((widget.transaction.serviceType) == 'Prepaid')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 6, 20, 6),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Color(0x2A000000),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 12, 15, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Image.asset(
                            'assets/images/icons8-phonelink-ring-96.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          dateTimeFormat(
                              'yMMMd', widget.transaction.createdTime),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Color(0xFF747474),
                                  ),
                        ),
                        Stack(
                          children: [
                            IndicatorTransactionStatusWidget(
                              status: widget.transaction.status,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            '#${widget.transaction.id}',
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            child: Text(
                              'Phone Number',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 2,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 12),
                            child: Text(
                              widget.transaction.mobileNo,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Color(0xFF747474),
                                    lineHeight: 1,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              '₱ ${widget.transaction.grandTotal.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).orangePeel,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        if ((widget.transaction.serviceType) == 'Electricity')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 6, 20, 6),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Color(0x2A000000),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 12, 15, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Image.asset(
                            'assets/images/icons8-flash-on-96.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          dateTimeFormat(
                              'yMMMd', widget.transaction.createdTime),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Color(0xFF747474),
                                  ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 28,
                              decoration: BoxDecoration(),
                              child: IndicatorTransactionStatusWidget(
                                status: widget.transaction.status,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            '#${widget.transaction.id}',
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            child: Text(
                              'Biller code',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 2,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 12),
                            child: Text(
                              widget.transaction.billerCode,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Color(0xFF747474),
                                    lineHeight: 1,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              '₱ ${formatNumber(
                                widget.transaction.grandTotal,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).orangePeel,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
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
    );
  }
}
