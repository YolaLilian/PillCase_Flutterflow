import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class EditMedicinLinkWidget extends StatefulWidget {
  const EditMedicinLinkWidget({Key key}) : super(key: key);

  @override
  _EditMedicinLinkWidgetState createState() => _EditMedicinLinkWidgetState();
}

class _EditMedicinLinkWidgetState extends State<EditMedicinLinkWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var newCode = '';

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
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 60),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-0.35, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Koppeling\nmedicijndoos',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 36,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Text(
                                'Huidige medicijndooscode',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Text(
                                currentUserDocument?.medicinboxCode,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF5F5F5F),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Text(
                                'Nieuwe medicijndooscode',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                newCode =
                                    await FlutterBarcodeScanner.scanBarcode(
                                  '#C62828', // scanning line color
                                  'Annuleren', // cancel button text
                                  true, // whether to show the flash icon
                                  ScanMode.QR,
                                );

                                setState(() {});
                              },
                              child: Text(
                                newCode,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF5F5F5F),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 40,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final usersUpdateData = createUsersRecordData(
                              medicinboxCode: newCode,
                            );
                            await currentUserReference.update(usersUpdateData);
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'Settings'),
                              ),
                              (r) => false,
                            );
                          },
                          text: 'Sla op',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: Color(0xFF00D43B),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Roboto',
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
                    ],
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
