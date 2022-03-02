import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../success_payment_merchant/success_payment_merchant_widget.dart';
import '../topup/topup_widget.dart';
import '../verify_security_code_pulsa/verify_security_code_pulsa_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PayToMerchantWidget extends StatefulWidget {
  const PayToMerchantWidget({
    Key key,
    this.merchantTransactionID,
  }) : super(key: key);

  final String merchantTransactionID;

  @override
  _PayToMerchantWidgetState createState() => _PayToMerchantWidgetState();
}

class _PayToMerchantWidgetState extends State<PayToMerchantWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference),
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
            final stackUsersRecord = snapshot.data;
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).platinum,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.link_off_rounded,
                        color: FlutterFlowTheme.of(context).rosewood,
                        size: 120,
                      ),
                      Text(
                        'Invalid QR Code',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Source Sans Pro',
                              color: FlutterFlowTheme.of(context).rosewood,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Back',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: FlutterFlowTheme.of(context).platinum,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Source Sans Pro',
                                  color:
                                      FlutterFlowTheme.of(context).orangePeel,
                                  fontWeight: FontWeight.bold,
                                ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).orangePeel,
                              width: 2,
                            ),
                            borderRadius: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<MerchantTransactionRecord>>(
                  future: queryMerchantTransactionRecordOnce(
                    queryBuilder: (merchantTransactionRecord) =>
                        merchantTransactionRecord.where('id',
                            isEqualTo: widget.merchantTransactionID),
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
                    List<MerchantTransactionRecord>
                        stackMerchantTransactionRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final stackMerchantTransactionRecord =
                        stackMerchantTransactionRecordList.isNotEmpty
                            ? stackMerchantTransactionRecordList.first
                            : null;
                    return Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).platinum,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 190, 20, 20),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Color(0xFFBDBDBD),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Image.network(
                                          stackMerchantTransactionRecord
                                              .businessImage,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              stackMerchantTransactionRecord
                                                  .businessName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oxfordBlue,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Color(0xFFCACACA),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Text(
                                          'Payment Detail',
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 12, 20, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Payment Method',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .pewterBlue,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Your Balance',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .oxfordBlue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Paid amount',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .oxfordBlue,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '₱ ${formatNumber(
                                                  stackMerchantTransactionRecord
                                                      .amount,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                )}',
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .orangePeel,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                stackMerchantTransactionRecord.requester),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: SpinKitFadingFour(
                                      color: FlutterFlowTheme.of(context)
                                          .orangePeel,
                                      size: 50,
                                    ),
                                  ),
                                );
                              }
                              final containerUsersRecord = snapshot.data;
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).cultured,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Color(0xFFE6E6E6),
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 12, 20, 0),
                                        child: Text(
                                          'Your Balance will be deduct as paid amount.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Source Sans Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .oxfordBlue,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 6, 0, 6),
                                          child: Text(
                                            'Remaining Balance',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .pewterBlue,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 20, 0),
                                              child: Text(
                                                functions
                                                    .getEstimateRemainingBalance(
                                                        stackUsersRecord
                                                            .currentBalance,
                                                        stackMerchantTransactionRecord
                                                            .amount)
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .orangePeel,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 40),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (functions.isMerchantTransactionValidToPayNow(
                                                  stackMerchantTransactionRecord
                                                      .status,
                                                  functions
                                                      .getEstimateRemainingBalance(
                                                          stackUsersRecord
                                                              .currentBalance,
                                                          stackMerchantTransactionRecord
                                                              .amount)) ??
                                              true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 20, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() => FFAppState()
                                                          .isSecurityCodeVerified =
                                                      false);
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          VerifySecurityCodePulsaWidget(),
                                                    ),
                                                  );
                                                  if ((FFAppState()
                                                          .isSecurityCodeVerified) ==
                                                      true) {
                                                    final merchantTransactionUpdateData =
                                                        createMerchantTransactionRecordData(
                                                      status: 'Complete',
                                                      paidOn:
                                                          getCurrentTimestamp,
                                                      payer: stackUsersRecord
                                                          .reference,
                                                    );
                                                    await stackMerchantTransactionRecord
                                                        .reference
                                                        .update(
                                                            merchantTransactionUpdateData);
                                                  } else {
                                                    return;
                                                  }
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    currentBalance: functions
                                                        .getEstimateRemainingBalance(
                                                            stackUsersRecord
                                                                .currentBalance,
                                                            stackMerchantTransactionRecord
                                                                .amount),
                                                  );
                                                  await stackUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          SuccessPaymentMerchantWidget(
                                                        merchantTransaction:
                                                            stackMerchantTransactionRecord,
                                                        merchantBalance:
                                                            containerUsersRecord
                                                                .currentBalance,
                                                      ),
                                                    ),
                                                    (r) => false,
                                                  );
                                                },
                                                text: 'Pay now',
                                                icon: Icon(
                                                  Icons.shield,
                                                  size: 15,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 44,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .oxfordBlue,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Source Sans Pro',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 4,
                                                ),
                                              ),
                                            ),
                                          if (functions.isMerchantTransactionInsufficientBalance(
                                                  stackMerchantTransactionRecord
                                                      .status,
                                                  functions
                                                      .getEstimateRemainingBalance(
                                                          stackUsersRecord
                                                              .currentBalance,
                                                          stackMerchantTransactionRecord
                                                              .amount)) ??
                                              true)
                                            Text(
                                              'Insufficient Balance',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .rosewood,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          if (functions.isMerchantTransactionInsufficientBalance(
                                                  stackMerchantTransactionRecord
                                                      .status,
                                                  functions
                                                      .getEstimateRemainingBalance(
                                                          stackUsersRecord
                                                              .currentBalance,
                                                          stackMerchantTransactionRecord
                                                              .amount)) ??
                                              true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 2, 20, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          TopupWidget(
                                                        currentBalance:
                                                            stackUsersRecord
                                                                .currentBalance,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                text: 'Top up',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 44,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .oxfordBlue,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Source Sans Pro',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 4,
                                                ),
                                              ),
                                            ),
                                          if (functions.isMerchantTransactionPaid(
                                                  stackMerchantTransactionRecord
                                                      .status) ??
                                              true)
                                            Text(
                                              'Transaction Completed',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    color: Color(0xFF095B00),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 120, 20, 20),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Color(0xFFBDBDBD),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
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
                                                  15, 12, 15, 12),
                                          child: Text(
                                            'Current balance',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .oxfordBlue,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
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
                                            '₱ ${stackUsersRecord.currentBalance.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .orangePeel,
                                                  fontSize: 18,
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
                  },
                ),
                Container(
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
                            'Confirm Payment',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Source Sans Pro',
                                  color: FlutterFlowTheme.of(context).platinum,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
