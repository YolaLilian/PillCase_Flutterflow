import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_compartment/edit_compartment_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompartmentsWidget extends StatefulWidget {
  const CompartmentsWidget({Key key}) : super(key: key);

  @override
  _CompartmentsWidgetState createState() => _CompartmentsWidgetState();
}

class _CompartmentsWidgetState extends State<CompartmentsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.tertiaryColor,
            shape: BoxShape.rectangle,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.05, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 20),
                        child: Text(
                          dateTimeFormat('MMMMEEEEd', getCurrentTimestamp),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.title3,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: Text(
                        dateTimeFormat('Hm', getCurrentTimestamp),
                        style: FlutterFlowTheme.bodyText1,
                      ),
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
                    List<CompartmentsRecord>
                        listViewCompartmentsCompartmentsRecordList =
                        snapshot.data;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          listViewCompartmentsCompartmentsRecordList.length,
                      itemBuilder: (context, listViewCompartmentsIndex) {
                        final listViewCompartmentsCompartmentsRecord =
                            listViewCompartmentsCompartmentsRecordList[
                                listViewCompartmentsIndex];

                        return Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 5, 30, 5),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: checkIfDateTimePassed(listViewCompartmentsCompartmentsRecord.plannedDate),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewCompartmentsCompartmentsRecord
                                                  .name
                                                  .maybeHandleOverflow(
                                                maxChars: 14,
                                                replacement: '…',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),

                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.edit_rounded,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditCompartmentWidget(
                                                    index:
                                                        listViewCompartmentsCompartmentsRecord
                                                            .reference,
                                                    time:
                                                        listViewCompartmentsCompartmentsRecord,
                                                    name:
                                                        listViewCompartmentsCompartmentsRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 20),
                                        child: Text(
                                          dateTimeFormat(
                                              'Hm',
                                              listViewCompartmentsCompartmentsRecord
                                                  .plannedDate),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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

Color checkIfDateTimePassed(DateTime s) {
  if (s != null) {
    if (s.isBefore(DateTime.now())) {
      return FlutterFlowTheme.secondaryColor;
    } else {
      return FlutterFlowTheme.warning;
    }
  } else return Colors.transparent;
}
