import '../backend/backend.dart';
import '../components/compartment_header_widget.dart';
import '../components/empty_pill_list_widget.dart';
import '../components/pill_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0xFF00D43B),
        icon: Icon(
          Icons.add,
        ),
        elevation: 8,
        label: Text(
          'Voeg pil toe',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(18, 18, 0, 0),
              child: Text(
                'Monday, 23 December',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18, 18, 18, 0),
                child: StreamBuilder<List<CompartmentsRecord>>(
                  stream: queryCompartmentsRecord(),
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
                      return Center(
                        child: Container(
                          height: 45,
                          child: EmptyPillListWidget(),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewCompartmentsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewCompartmentsRecord =
                            listViewCompartmentsRecordList[listViewIndex];
                        return Stack(
                          children: [
                            CompartmentHeaderWidget(
                              compartmentName: 'PlaceHolder',
                              compartmentTime: 'PlaceHolder',
                              compartmentIcon: Icon(
                                Icons.threesixty_sharp,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 36, 0, 8),
                                    child: PillWidget(
                                      compartmentName: 'placeholder',
                                      compartmentTime: 'placeholder',
                                      compartmentIcon: Icon(
                                        Icons.check_circle,
                                        color: FlutterFlowTheme.secondaryColor,
                                        size: 23,
                                      ),
                                      pillName: 'placeholder',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
