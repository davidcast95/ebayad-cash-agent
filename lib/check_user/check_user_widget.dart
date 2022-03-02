import '../auth/auth_util.dart';
import '../backend/backend.dart';
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
              // Return an empty Container when the document does not exist.
              if (snapshot.data.isEmpty) {
                return Container();
              }
              final stackUsersRecord = stackUsersRecordList.isNotEmpty
                  ? stackUsersRecordList.first
                  : null;
              return InkWell(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Stack(
                  children: [],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
