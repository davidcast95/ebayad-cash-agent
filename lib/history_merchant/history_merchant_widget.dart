import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryMerchantWidget extends StatefulWidget {
  const HistoryMerchantWidget({Key key}) : super(key: key);

  @override
  _HistoryMerchantWidgetState createState() => _HistoryMerchantWidgetState();
}

class _HistoryMerchantWidgetState extends State<HistoryMerchantWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: FutureBuilder<List<MerchantsRecord>>(
          future: queryMerchantsRecordOnce(
            queryBuilder: (merchantsRecord) =>
                merchantsRecord.where('user', isEqualTo: currentUserReference),
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
            List<MerchantsRecord> stackMerchantsRecordList = snapshot.data;
            // Return an empty Container when the document does not exist.
            if (snapshot.data.isEmpty) {
              return Container();
            }
            final stackMerchantsRecord = stackMerchantsRecordList.isNotEmpty
                ? stackMerchantsRecordList.first
                : null;
            return Stack(
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 2,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).oxfordBlue,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0.75),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.chevron_left_rounded,
                                  color: FlutterFlowTheme.of(context).platinum,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Align(
                            alignment: AlignmentDirectional(0, 0.5),
                            child: Text(
                              'Order',
                              style: FlutterFlowTheme.of(context)
                                  .title1
                                  .override(
                                    fontFamily: 'Source Sans Pro',
                                    color:
                                        FlutterFlowTheme.of(context).platinum,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: FutureBuilder<List<MerchantTransactionRecord>>(
                    future: queryMerchantTransactionRecordOnce(
                      queryBuilder: (merchantTransactionRecord) =>
                          merchantTransactionRecord
                              .where('merchant',
                                  isEqualTo: stackMerchantsRecord.reference)
                              .orderBy('created_time', descending: true),
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
                      List<MerchantTransactionRecord>
                          listViewMerchantTransactionRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewMerchantTransactionRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewMerchantTransactionRecord =
                              listViewMerchantTransactionRecordList[
                                  listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 6, 20, 6),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 12, 15, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Pay Merchant',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .oxfordBlue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6, 0, 0, 0),
                                          child: Text(
                                            dateTimeFormat(
                                                'relative',
                                                listViewMerchantTransactionRecord
                                                    .createdTime),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: Color(0xFF747474),
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '#${listViewMerchantTransactionRecord.id}',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  fontSize: 14,
                                                ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 15, 0),
                                            child: Text(
                                              'Merchant',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        lineHeight: 2,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 15, 12),
                                            child: Text(
                                              listViewMerchantTransactionRecord
                                                  .businessName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        color:
                                                            Color(0xFF747474),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 20, 0),
                                            child: Text(
                                              '₱ ${formatNumber(
                                                listViewMerchantTransactionRecord
                                                    .amount,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .orangePeel,
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
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
