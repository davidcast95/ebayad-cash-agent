import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/list_transaction_row_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionWidget extends StatefulWidget {
  const TransactionWidget({Key key}) : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
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
                child: Align(
                  alignment: AlignmentDirectional(0, 0.5),
                  child: Text(
                    'Transactions',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Source Sans Pro',
                          color: FlutterFlowTheme.of(context).platinum,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: StreamBuilder<List<TransactionRecord>>(
                stream: queryTransactionRecord(
                  queryBuilder: (transactionRecord) => transactionRecord
                      .where('user', isEqualTo: currentUserReference),
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
                  List<TransactionRecord> listViewTransactionRecordList =
                      snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewTransactionRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewTransactionRecord =
                          listViewTransactionRecordList[listViewIndex];
                      return ListTransactionRowWidget(
                        transaction: listViewTransactionRecord,
                      );
                    },
                  );
                },
              ),
            ),
            if (FFAppState().isRestricted ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).platinum,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.lock,
                          color: FlutterFlowTheme.of(context).oxfordBlue,
                          size: 48,
                        ),
                      ),
                      Text(
                        'You are restricted to view this page',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
