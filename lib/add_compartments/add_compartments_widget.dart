import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_pill_modal_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';

class AddCompartmentsWidget extends StatefulWidget {
  const AddCompartmentsWidget({Key key}) : super(key: key);

  @override
  _AddCompartmentsWidgetState createState() => _AddCompartmentsWidgetState();
}

class _AddCompartmentsWidgetState extends State<AddCompartmentsWidget> {
  DateTime datePicked1;
  TextEditingController textController1;
  PageController pageViewController;
  DateTime datePicked2;
  TextEditingController textController2;
  DateTime datePicked3;
  TextEditingController textController3;
  DateTime datePicked4;
  TextEditingController textController4;
  DateTime datePicked5;
  TextEditingController textController5;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
  }

  Future<void> _scheduleCompartmentTime(
      int id, String title, DateTime compartmentTime) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        'Het is tijd om uw medicijn(en) in te nemen',
        getTZDateTime(compartmentTime),
        const NotificationDetails(
          android: AndroidNotificationDetails('daily notification channel id',
              'daily notification channel name',
              channelDescription: 'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime);
  }

  tz.TZDateTime getTZDateTime(DateTime compartmentTime) {
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local,
        compartmentTime.year,
        compartmentTime.month,
        compartmentTime.day,
        compartmentTime.hour,
        compartmentTime.minute);
    return scheduledDate;
  }

  @override
  Widget build(BuildContext context) {
    // var compartmentPillReferences;
    var userPillsMap = [];
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                  child: StreamBuilder<List<CompartmentsRecord>>(
                      stream: queryCompartmentsRecord(
                        queryBuilder: (compartmentsRecord) => compartmentsRecord
                            .where('user', isEqualTo: currentUserReference)
                            .orderBy('index'),
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
                        List<CompartmentsRecord> compartments = snapshot.data;
                        return PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  compartments[0].name,
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'Deze gegevens kunnen later aangepast worden',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF5F5F5F),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Naam compartement (optioneel)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        border: Border.all(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                            textController1,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              compartments[0]
                                                                  .name,
                                                          hintStyle:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Tijdstip van openen compartement',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await DatePicker
                                                            .showDateTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          onConfirm: (date) {
                                                            setState(() =>
                                                                datePicked1 =
                                                                    date);
                                                          },
                                                          currentTime:
                                                              getCurrentTimestamp,
                                                          minTime:
                                                              getCurrentTimestamp,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          border: Border.all(
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      12, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat('Hm',
                                                                datePicked1),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: StreamBuilder<List<PillsRecord>>(
                                        stream: queryPillsRecord(
                                          queryBuilder: (pillsRecord) =>
                                              pillsRecord.where('user',
                                                  isEqualTo:
                                                      currentUserReference),
                                        ),
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
                                          List<PillsRecord>
                                              listViewPillsRecordList =
                                              snapshot.data;

                                          if (listViewPillsRecordList.length >
                                              userPillsMap.length) {
                                            listViewPillsRecordList
                                                .forEach((userPill) => {
                                                      userPillsMap.add({
                                                        userPill.reference:
                                                            false
                                                      })
                                                    });
                                          }

                                          for (var index =
                                                  listViewPillsRecordList
                                                      .length;
                                              index >= 1;
                                              index--) {
                                            userPillsMap[index - 1][
                                                listViewPillsRecordList[
                                                        index - 1]
                                                    .reference] = false;
                                          }

                                          if (listViewPillsRecordList.isEmpty) {
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Text(
                                                'Geen pillen gevonden voor dit account...',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF5F5F5F),
                                                ),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewPillsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPillsRecord =
                                                  listViewPillsRecordList[
                                                      listViewIndex];

                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: CheckboxListTile(
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    title: Text(
                                                        listViewPillsRecord
                                                            .name),
                                                    value: userPillsMap[
                                                            listViewIndex][
                                                        listViewPillsRecord
                                                            .reference],
                                                    onChanged: (bool newValue) {
                                                      setState(() {
                                                        userPillsMap[
                                                                    listViewIndex]
                                                                [
                                                                listViewPillsRecord
                                                                    .reference] =
                                                            newValue;
                                                      });
                                                    },
                                                  ),
                                                );
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  child: AddPillModalWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Voeg pil toe',
                                        options: FFButtonOptions(
                                          width: 150,
                                          height: 40,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 0, 30, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var userPillMap = {};
                                          var checkedPills = [];

                                          userPillsMap.forEach((userPill) {
                                            userPillMap.addAll(userPill);
                                          });

                                          for (var userPillMap
                                              in userPillMap.entries) {
                                            if (userPillMap.value) {
                                              checkedPills.add(userPillMap.key);
                                            }
                                          }

                                          final compartmentsUpdateData =
                                              createCompartmentsRecordData(
                                                  name: valueOrDefault<String>(
                                                      textController1.text,
                                                      'Compartement 1'),
                                                  plannedDate: datePicked1,
                                                  pills: ListBuilder(
                                                      checkedPills));

                                          if (datePicked1 != null) {
                                            var notificationId = 0;
                                            var notificationTitle =
                                                "Open ${textController1.text.isEmpty ? "Compartement 1" : textController1.text} (box 1)";
                                            _scheduleCompartmentTime(
                                                notificationId,
                                                notificationTitle,
                                                datePicked1);
                                          }

                                          await compartments[0]
                                              .reference
                                              .update(compartmentsUpdateData);

                                          String data = "Dit is een ESP test";
                                          String pillcaseAddress =
                                              // placeholder (earbuds or other device)
                                              "00:1B:66:CB:68:F5";
                                              // "C8:C9:A3:CA:99:86"; //We should get this address from app settings

                                          var status = await Permission
                                              .bluetooth.status;

                                          if (status.isDenied) {
                                            status = await Permission.bluetooth.request();
                                            print(status);
                                          }
                                          if (status.isGranted){

                                            try {
                                            FlutterBluetoothSerial.instance
                                                .bondDeviceAtAddress(
                                                    pillcaseAddress);

                                            BluetoothConnection connection =
                                                await BluetoothConnection
                                                    .toAddress(pillcaseAddress);
                                            print('Connected to the pillcase');

                                            connection.output.add(Uint8List
                                                .fromList(utf8.encode(data +
                                                    "\r\n"))); // Sending data
                                            //connection.output.add(Uint8List.fromList(utf8.encode(data2 + "\r\n"))); // Sending more data

                                            connection.finish();
                                            print('Connection stopped.');
                                            } catch (exception) {
                                              //do something?
                                              print(
                                                  'Cannot connect, exception occured');
                                            }
                                          }

                                          await pageViewController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );

                                        },
                                        text: 'Opslaan',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color:
                                              FlutterFlowTheme.secondaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  compartments[1].name,
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'Deze gegevens kunnen later aangepast worden',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF5F5F5F),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Naam compartement (optioneel)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        border: Border.all(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                            textController2,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              compartments[1]
                                                                  .name,
                                                          hintStyle:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Tijdstip van openen compartement',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await DatePicker
                                                            .showDateTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          onConfirm: (date) {
                                                            setState(() =>
                                                                datePicked2 =
                                                                    date);
                                                          },
                                                          currentTime:
                                                              getCurrentTimestamp,
                                                          minTime:
                                                              getCurrentTimestamp,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          border: Border.all(
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      12, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat('Hm',
                                                                datePicked2),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: StreamBuilder<List<PillsRecord>>(
                                        stream: queryPillsRecord(
                                          queryBuilder: (pillsRecord) =>
                                              pillsRecord.where('user',
                                                  isEqualTo:
                                                      currentUserReference),
                                        ),
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
                                          List<PillsRecord>
                                              listViewPillsRecordList =
                                              snapshot.data;

                                          if (listViewPillsRecordList.length >
                                              userPillsMap.length) {
                                            listViewPillsRecordList
                                                .forEach((userPill) => {
                                                      userPillsMap.add({
                                                        userPill.reference:
                                                            false
                                                      })
                                                    });
                                          }

                                          for (var index =
                                                  listViewPillsRecordList
                                                      .length;
                                              index >= 1;
                                              index--) {
                                            userPillsMap[index - 1][
                                                listViewPillsRecordList[
                                                        index - 1]
                                                    .reference] = false;
                                          }

                                          if (listViewPillsRecordList.isEmpty) {
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Text(
                                                'Geen pillen gevonden voor dit account...',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF5F5F5F),
                                                ),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewPillsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPillsRecord =
                                                  listViewPillsRecordList[
                                                      listViewIndex];

                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: CheckboxListTile(
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    title: Text(
                                                        listViewPillsRecord
                                                            .name),
                                                    value: userPillsMap[
                                                            listViewIndex][
                                                        listViewPillsRecord
                                                            .reference],
                                                    onChanged: (bool newValue) {
                                                      setState(() {
                                                        userPillsMap[
                                                                    listViewIndex]
                                                                [
                                                                listViewPillsRecord
                                                                    .reference] =
                                                            newValue;
                                                      });
                                                    },
                                                  ),
                                                );
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  child: AddPillModalWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Voeg pil toe',
                                        options: FFButtonOptions(
                                          width: 150,
                                          height: 40,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 0, 30, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var userPillMap = {};
                                          var checkedPills = [];

                                          userPillsMap.forEach((userPill) {
                                            userPillMap.addAll(userPill);
                                          });

                                          for (var userPillMap
                                              in userPillMap.entries) {
                                            if (userPillMap.value) {
                                              checkedPills.add(userPillMap.key);
                                            }
                                          }

                                          final compartmentsUpdateData =
                                              createCompartmentsRecordData(
                                                  name: valueOrDefault<String>(
                                                      textController2.text,
                                                      'Compartement 2'),
                                                  plannedDate: datePicked2,
                                                  pills: ListBuilder(
                                                      checkedPills));

                                          if (datePicked2 != null) {
                                            var notificationId = 1;
                                            var notificationTitle =
                                                "Open ${textController2.text.isEmpty ? "Compartement 2" : textController2.text} (box 2)";
                                            _scheduleCompartmentTime(
                                                notificationId,
                                                notificationTitle,
                                                datePicked1);
                                          }

                                          await compartments[1]
                                              .reference
                                              .update(compartmentsUpdateData);

                                          try {
                                            String data = "Dit is een ESP test";
                                            String pillcaseAddress =
                                                "C8:C9:A3:CA:99:86"; //We should get this address from app settings

                                            BluetoothConnection connection =
                                                await BluetoothConnection
                                                    .toAddress(pillcaseAddress);
                                            print('Connected to the pillcase');

                                            connection.output.add(Uint8List
                                                .fromList(utf8.encode(data +
                                                    "\r\n"))); // Sending data
                                            //connection.output.add(Uint8List.fromList(utf8.encode(data2 + "\r\n"))); // Sending more data

                                            connection.finish();
                                            print('Connection stopped.');
                                          } catch (exception) {
                                            //do something?
                                            print(
                                                'Cannot connect, exception occured');
                                          }

                                          await pageViewController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text: 'Opslaan',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color:
                                              FlutterFlowTheme.secondaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  compartments[2].name,
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'Deze gegevens kunnen later aangepast worden',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF5F5F5F),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Naam compartement (optioneel)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        border: Border.all(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                            textController3,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              compartments[2]
                                                                  .name,
                                                          hintStyle:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Tijdstip van openen compartement',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await DatePicker
                                                            .showDateTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          onConfirm: (date) {
                                                            setState(() =>
                                                                datePicked3 =
                                                                    date);
                                                          },
                                                          currentTime:
                                                              getCurrentTimestamp,
                                                          minTime:
                                                              getCurrentTimestamp,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          border: Border.all(
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      12, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat('Hm',
                                                                datePicked3),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: StreamBuilder<List<PillsRecord>>(
                                        stream: queryPillsRecord(
                                          queryBuilder: (pillsRecord) =>
                                              pillsRecord.where('user',
                                                  isEqualTo:
                                                      currentUserReference),
                                        ),
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
                                          List<PillsRecord>
                                              listViewPillsRecordList =
                                              snapshot.data;

                                          if (listViewPillsRecordList.length >
                                              userPillsMap.length) {
                                            listViewPillsRecordList
                                                .forEach((userPill) => {
                                                      userPillsMap.add({
                                                        userPill.reference:
                                                            false
                                                      })
                                                    });
                                          }

                                          for (var index =
                                                  listViewPillsRecordList
                                                      .length;
                                              index >= 1;
                                              index--) {
                                            userPillsMap[index - 1][
                                                listViewPillsRecordList[
                                                        index - 1]
                                                    .reference] = false;
                                          }

                                          if (listViewPillsRecordList.isEmpty) {
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Text(
                                                'Geen pillen gevonden voor dit account...',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF5F5F5F),
                                                ),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewPillsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPillsRecord =
                                                  listViewPillsRecordList[
                                                      listViewIndex];

                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: CheckboxListTile(
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    title: Text(
                                                        listViewPillsRecord
                                                            .name),
                                                    value: userPillsMap[
                                                            listViewIndex][
                                                        listViewPillsRecord
                                                            .reference],
                                                    onChanged: (bool newValue) {
                                                      setState(() {
                                                        userPillsMap[
                                                                    listViewIndex]
                                                                [
                                                                listViewPillsRecord
                                                                    .reference] =
                                                            newValue;
                                                      });
                                                    },
                                                  ),
                                                );
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  child: AddPillModalWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Voeg pil toe',
                                        options: FFButtonOptions(
                                          width: 150,
                                          height: 40,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 0, 30, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var userPillMap = {};
                                          var checkedPills = [];

                                          userPillsMap.forEach((userPill) {
                                            userPillMap.addAll(userPill);
                                          });

                                          for (var userPillMap
                                              in userPillMap.entries) {
                                            if (userPillMap.value) {
                                              checkedPills.add(userPillMap.key);
                                            }
                                          }

                                          final compartmentsUpdateData =
                                              createCompartmentsRecordData(
                                                  name: valueOrDefault<String>(
                                                      textController3.text,
                                                      'Compartement 3'),
                                                  plannedDate: datePicked3,
                                                  pills: ListBuilder(
                                                      checkedPills));

                                          if (datePicked3 != null) {
                                            var notificationId = 2;
                                            var notificationTitle =
                                                "Open ${textController3.text.isEmpty ? "Compartement 3" : textController3.text} (box 3)";
                                            _scheduleCompartmentTime(
                                                notificationId,
                                                notificationTitle,
                                                datePicked1);
                                          }

                                          await compartments[2]
                                              .reference
                                              .update(compartmentsUpdateData);

                                          try {
                                            String data = "Dit is een ESP test";
                                            String pillcaseAddress =
                                                "C8:C9:A3:CA:99:86"; //We should get this address from app settings

                                            BluetoothConnection connection =
                                                await BluetoothConnection
                                                    .toAddress(pillcaseAddress);
                                            print('Connected to the pillcase');

                                            connection.output.add(Uint8List
                                                .fromList(utf8.encode(data +
                                                    "\r\n"))); // Sending data
                                            //connection.output.add(Uint8List.fromList(utf8.encode(data2 + "\r\n"))); // Sending more data

                                            connection.finish();
                                            print('Connection stopped.');
                                          } catch (exception) {
                                            //do something?
                                            print(
                                                'Cannot connect, exception occured');
                                          }

                                          await pageViewController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text: 'Opslaan',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color:
                                              FlutterFlowTheme.secondaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  compartments[3].name,
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'Deze gegevens kunnen later aangepast worden',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF5F5F5F),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Naam compartement (optioneel)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        border: Border.all(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                            textController4,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              compartments[3]
                                                                  .name,
                                                          hintStyle:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Tijdstip van openen compartement',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await DatePicker
                                                            .showDateTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          onConfirm: (date) {
                                                            setState(() =>
                                                                datePicked4 =
                                                                    date);
                                                          },
                                                          currentTime:
                                                              getCurrentTimestamp,
                                                          minTime:
                                                              getCurrentTimestamp,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          border: Border.all(
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      12, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat('Hm',
                                                                datePicked4),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: StreamBuilder<List<PillsRecord>>(
                                        stream: queryPillsRecord(
                                          queryBuilder: (pillsRecord) =>
                                              pillsRecord.where('user',
                                                  isEqualTo:
                                                      currentUserReference),
                                        ),
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
                                          List<PillsRecord>
                                              listViewPillsRecordList =
                                              snapshot.data;

                                          if (listViewPillsRecordList.length >
                                              userPillsMap.length) {
                                            listViewPillsRecordList
                                                .forEach((userPill) => {
                                                      userPillsMap.add({
                                                        userPill.reference:
                                                            false
                                                      })
                                                    });
                                          }

                                          for (var index =
                                                  listViewPillsRecordList
                                                      .length;
                                              index >= 1;
                                              index--) {
                                            userPillsMap[index - 1][
                                                listViewPillsRecordList[
                                                        index - 1]
                                                    .reference] = false;
                                          }

                                          if (listViewPillsRecordList.isEmpty) {
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Text(
                                                'Geen pillen gevonden voor dit account...',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF5F5F5F),
                                                ),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewPillsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPillsRecord =
                                                  listViewPillsRecordList[
                                                      listViewIndex];

                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: CheckboxListTile(
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    title: Text(
                                                        listViewPillsRecord
                                                            .name),
                                                    value: userPillsMap[
                                                            listViewIndex][
                                                        listViewPillsRecord
                                                            .reference],
                                                    onChanged: (bool newValue) {
                                                      setState(() {
                                                        userPillsMap[
                                                                    listViewIndex]
                                                                [
                                                                listViewPillsRecord
                                                                    .reference] =
                                                            newValue;
                                                      });
                                                    },
                                                  ),
                                                );
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  child: AddPillModalWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Voeg pil toe',
                                        options: FFButtonOptions(
                                          width: 150,
                                          height: 40,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 0, 30, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var userPillMap = {};
                                          var checkedPills = [];

                                          userPillsMap.forEach((userPill) {
                                            userPillMap.addAll(userPill);
                                          });

                                          for (var userPillMap
                                              in userPillMap.entries) {
                                            if (userPillMap.value) {
                                              checkedPills.add(userPillMap.key);
                                            }
                                          }

                                          final compartmentsUpdateData =
                                              createCompartmentsRecordData(
                                                  name: valueOrDefault<String>(
                                                      textController4.text,
                                                      'Compartement 4'),
                                                  plannedDate: datePicked4,
                                                  pills: ListBuilder(
                                                      checkedPills));

                                          if (datePicked4 != null) {
                                            var notificationId = 3;
                                            var notificationTitle =
                                                "Open ${textController4.text.isEmpty ? "Compartement 4" : textController4.text} (box 4)";
                                            _scheduleCompartmentTime(
                                                notificationId,
                                                notificationTitle,
                                                datePicked1);
                                          }

                                          await compartments[3]
                                              .reference
                                              .update(compartmentsUpdateData);

                                          try {
                                            String data = "Dit is een ESP test";
                                            String pillcaseAddress =
                                                "C8:C9:A3:CA:99:86"; //We should get this address from app settings

                                            BluetoothConnection connection =
                                                await BluetoothConnection
                                                    .toAddress(pillcaseAddress);
                                            print('Connected to the pillcase');

                                            connection.output.add(Uint8List
                                                .fromList(utf8.encode(data +
                                                    "\r\n"))); // Sending data
                                            //connection.output.add(Uint8List.fromList(utf8.encode(data2 + "\r\n"))); // Sending more data

                                            connection.finish();
                                            print('Connection stopped.');
                                          } catch (exception) {
                                            //do something?
                                            print(
                                                'Cannot connect, exception occured');
                                          }

                                          await pageViewController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text: 'Opslaan',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color:
                                              FlutterFlowTheme.secondaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  compartments[4].name,
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 36,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'Deze gegevens kunnen later aangepast worden',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF5F5F5F),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Naam compartement (optioneel)',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.85,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        border: Border.all(
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                            textController5,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              compartments[4]
                                                                  .name,
                                                          hintStyle:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Text(
                                                          'Tijdstip van openen compartement',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .subtitle1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await DatePicker
                                                            .showDateTimePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          onConfirm: (date) {
                                                            setState(() =>
                                                                datePicked5 =
                                                                    date);
                                                          },
                                                          currentTime:
                                                              getCurrentTimestamp,
                                                          minTime:
                                                              getCurrentTimestamp,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.85,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          border: Border.all(
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      12, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat('Hm',
                                                                datePicked5),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: StreamBuilder<List<PillsRecord>>(
                                        stream: queryPillsRecord(
                                          queryBuilder: (pillsRecord) =>
                                              pillsRecord.where('user',
                                                  isEqualTo:
                                                      currentUserReference),
                                        ),
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
                                          List<PillsRecord>
                                              listViewPillsRecordList =
                                              snapshot.data;

                                          if (listViewPillsRecordList.length >
                                              userPillsMap.length) {
                                            listViewPillsRecordList
                                                .forEach((userPill) => {
                                                      userPillsMap.add({
                                                        userPill.reference:
                                                            false
                                                      })
                                                    });
                                          }

                                          for (var index =
                                                  listViewPillsRecordList
                                                      .length;
                                              index >= 1;
                                              index--) {
                                            userPillsMap[index - 1][
                                                listViewPillsRecordList[
                                                        index - 1]
                                                    .reference] = false;
                                          }

                                          if (listViewPillsRecordList.isEmpty) {
                                            return Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Text(
                                                'Geen pillen gevonden voor dit account...',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF5F5F5F),
                                                ),
                                              ),
                                            );
                                          }

                                          return ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewPillsRecordList.length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewPillsRecord =
                                                  listViewPillsRecordList[
                                                      listViewIndex];

                                              return StatefulBuilder(
                                                  builder: (context, setState) {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: CheckboxListTile(
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    title: Text(
                                                        listViewPillsRecord
                                                            .name),
                                                    value: userPillsMap[
                                                            listViewIndex][
                                                        listViewPillsRecord
                                                            .reference],
                                                    onChanged: (bool newValue) {
                                                      setState(() {
                                                        userPillsMap[
                                                                    listViewIndex]
                                                                [
                                                                listViewPillsRecord
                                                                    .reference] =
                                                            newValue;
                                                      });
                                                    },
                                                  ),
                                                );
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  child: AddPillModalWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Voeg pil toe',
                                        options: FFButtonOptions(
                                          width: 150,
                                          height: 40,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30, 0, 30, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var userPillMap = {};
                                          var checkedPills = [];

                                          userPillsMap.forEach((userPill) {
                                            userPillMap.addAll(userPill);
                                          });

                                          for (var userPillMap
                                              in userPillMap.entries) {
                                            if (userPillMap.value) {
                                              checkedPills.add(userPillMap.key);
                                            }
                                          }

                                          final compartmentsUpdateData =
                                              createCompartmentsRecordData(
                                                  name: valueOrDefault<String>(
                                                      textController5.text,
                                                      'Compartement 5'),
                                                  plannedDate: datePicked5,
                                                  pills: ListBuilder(
                                                      checkedPills));

                                          if (datePicked5 != null) {
                                            var notificationId = 4;
                                            var notificationTitle =
                                                "Open ${textController5.text.isEmpty ? "Compartement 5" : textController5.text} (box 5)";
                                            _scheduleCompartmentTime(
                                                notificationId,
                                                notificationTitle,
                                                datePicked1);
                                          }

                                          await compartments[4]
                                              .reference
                                              .update(compartmentsUpdateData);

                                          try {
                                            String data = "Dit is een ESP test";
                                            String pillcaseAddress =
                                                "C8:C9:A3:CA:99:86"; //We should get this address from app settings

                                            BluetoothConnection connection =
                                                await BluetoothConnection
                                                    .toAddress(pillcaseAddress);
                                            print('Connected to the pillcase');

                                            connection.output.add(Uint8List
                                                .fromList(utf8.encode(data +
                                                    "\r\n"))); // Sending data
                                            //connection.output.add(Uint8List.fromList(utf8.encode(data2 + "\r\n"))); // Sending more data

                                            connection.finish();
                                            print('Connection stopped.');
                                          } catch (exception) {
                                            //do something?
                                            print(
                                                'Cannot connect, exception occured');
                                          }

                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NavBarPage(
                                                  initialPage: 'Homepage'),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'Opslaan',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color:
                                              FlutterFlowTheme.secondaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: SmoothPageIndicator(
                      controller: pageViewController ??=
                          PageController(initialPage: 0),
                      count: 5,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) {
                        pageViewController.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: ExpandingDotsEffect(
                        expansionFactor: 2,
                        spacing: 8,
                        radius: 16,
                        dotWidth: 16,
                        dotHeight: 16,
                        dotColor: Color(0xFF9E9E9E),
                        activeDotColor: Color(0xFF3F51B5),
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
