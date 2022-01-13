import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_compartment_list_widget.dart';
import '../components/pill_card_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                        child: FlutterFlowCalendar(
                          color: FlutterFlowTheme.primaryColor,
                          weekFormat: true,
                          weekStartsMonday: true,
                          initialDate: getCurrentTimestamp,
                          onChange: (DateTimeRange newSelectedDate) {
                            setState(
                                () => calendarSelectedDay = newSelectedDate);
                          },
                          titleStyle: FlutterFlowTheme.subtitle1,
                          dayOfWeekStyle: TextStyle(),
                          dateStyle: TextStyle(),
                          selectedDateStyle: TextStyle(),
                          inactiveDateStyle: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<CompartmentsRecord>>(
                  stream: queryCompartmentsRecord(
                    queryBuilder: (compartmentsRecord) => compartmentsRecord
                        .where('user', isEqualTo: currentUserReference)
                        .where('planned_date',
                            isLessThan: calendarSelectedDay.end)
                        .where('planned_date',
                            isGreaterThan: calendarSelectedDay.start),
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
                                    child: checkStatusOfDates(
                                        listViewCompartmentsRecord
                                            .plannedDate)),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var pill
                                      in listViewCompartmentsRecord.pills)
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 30),
                                        child: StreamBuilder<PillsRecord>(
                                          stream: PillsRecord.getDocument(pill),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
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
                                      ),
                                    ),
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

Text checkStatusOfDates(DateTime plannedDate) {
  if (plannedDate != null) {
    var formattedDate = dateTimeFormat('Hm', plannedDate);
    if (plannedDate.isBefore(DateTime.now())) {
      return Text(
        'Gepland om: $formattedDate',
        style: GoogleFonts.getFont('Poppins',
            color: FlutterFlowTheme.secondaryColor,
            fontWeight: FontWeight.normal,
            fontSize: 16),
      );
    } else if (plannedDate.isAfter(DateTime.now())) {
      var relativeTime = plannedDate.difference(DateTime.now()).inHours;
      return Text(
        'Gepland om: $formattedDate\nNog $relativeTime uur te gaan',
        style: GoogleFonts.getFont('Poppins',
            color: FlutterFlowTheme.warning,
            fontWeight: FontWeight.normal,
            fontSize: 16),
      );
    } else {
      return Text("");
    }
  }
}
