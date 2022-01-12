import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_compartment_list_widget.dart';
import '../components/pill_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({Key key}) : super(key: key);

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.05, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 60, 0, 20),
                            child: Text(
                              dateTimeFormat('MMMMEEEEd', getCurrentTimestamp),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.title3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                StreamBuilder<List<CompartmentsRecord>>(
                  stream: queryCompartmentsRecord(
                    queryBuilder: (compartmentsRecord) => compartmentsRecord
                        .where('user', isEqualTo: currentUserReference),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      );
                    }
                    List<CompartmentsRecord> listViewCompartmentsRecordList =
                        snapshot.data;
                    if (listViewCompartmentsRecordList.isEmpty) {
                      return EmptyCompartmentListWidget();
                    }
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewCompartmentsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewCompartmentsRecord =
                            listViewCompartmentsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      listViewCompartmentsRecord.name
                                          .maybeHandleOverflow(
                                        maxChars: 22,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      dateTimeFormat(
                                          'relative',
                                          listViewCompartmentsRecord
                                              .plannedDate),
                                      style: FlutterFlowTheme.subtitle2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var pill
                                      in listViewCompartmentsRecord.pills)
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: StreamBuilder<PillsRecord>(
                                        stream: PillsRecord.getDocument(pill),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          var pill = snapshot.data;
                                          return PillCardWidget(
                                              pillName: pill.name);
                                        },
                                      ),
                                    ))
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
