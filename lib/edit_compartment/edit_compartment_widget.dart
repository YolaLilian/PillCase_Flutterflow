import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_pill_modal_widget.dart';
import '../edited_compartment/edited_compartment_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCompartmentWidget extends StatefulWidget {
  const EditCompartmentWidget({
    Key key,
    this.index,
    this.time,
    this.name,
  }) : super(key: key);

  final DocumentReference index;
  final CompartmentsRecord time;
  final CompartmentsRecord name;

  @override
  _EditCompartmentWidgetState createState() => _EditCompartmentWidgetState();
}

class _EditCompartmentWidgetState extends State<EditCompartmentWidget> {
  DateTime datePicked;
  TextEditingController textController;
  TextEditingController timeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.name.name);
    timeController = TextEditingController(text: dateTimeFormat('Hm', widget.name.plannedDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.tertiaryColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name.name.maybeHandleOverflow(
                                    maxChars: 12,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.title1,
                                ),
                                Text(
                                  'wijzigen',
                                  style: FlutterFlowTheme.title1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    child: Text(
                                      'Naam compartement (optioneel)',
                                      textAlign: TextAlign.start,
                                      style:
                                          FlutterFlowTheme.subtitle1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    border: Border.all(
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Naam compartement',
                                      hintStyle: FlutterFlowTheme.bodyText1,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                    ),
                                    style: FlutterFlowTheme.bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    child: Text(
                                      'Tijdstip van openen compartement',
                                      textAlign: TextAlign.start,
                                      style:
                                          FlutterFlowTheme.subtitle1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    border: Border.all(
                                      color: FlutterFlowTheme.primaryColor,
                                    ),
                                  ),
                                
                                child: TextFormField(
                                  onTap: () async {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    await DatePicker.showDateTimePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        timeController.text = dateTimeFormat('Hm', date);
                                        setState(() => datePicked = date);
                                      },
                                      currentTime: widget.time.plannedDate,
                                    );
                                  },
                                  controller: timeController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: dateTimeFormat('Hm', widget.name.plannedDate),
                                    hintStyle: FlutterFlowTheme.bodyText1,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                  ),
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                        textStyle: FlutterFlowTheme.subtitle2.override(
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
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final compartmentsUpdateData =
                              createCompartmentsRecordData(
                            name: textController.text,
                            plannedDate: datePicked,
                          );
                          await widget.name.reference
                              .update(compartmentsUpdateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditedCompartmentWidget(),
                            ),
                          );
                        },
                        text: 'Bewerken',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40,
                          color: FlutterFlowTheme.warning,
                          textStyle: FlutterFlowTheme.subtitle2.override(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
