import '../add_medicin_link/add_medicin_link_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController emailController;
  TextEditingController nameController;
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController repeatPasswordController;
  bool repeatPasswordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    repeatPasswordController = TextEditingController();
    repeatPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FlutterFlowIconButton(
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
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                              child: Text(
                                'Maak account',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                    child: Text(
                                      'Naam',
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
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: nameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Naam...',
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
                                        EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  ),
                                  style: FlutterFlowTheme.bodyText1,
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
                                      'Email',
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
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'E-mail...',
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
                                        EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  ),
                                  style: FlutterFlowTheme.bodyText1,
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
                                      'Wachtwoord',
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
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    hintText: 'Wachtwoord...',
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
                                        EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () =>
                                            passwordVisibility = !passwordVisibility,
                                      ),
                                      child: Icon(
                                        passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1,
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
                                      'Herhaal Wachtwoord',
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
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: repeatPasswordController,
                                  obscureText: !repeatPasswordVisibility,
                                  decoration: InputDecoration(
                                    hintText: 'Wachtwoord...',
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
                                        EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => repeatPasswordVisibility =
                                            !repeatPasswordVisibility,
                                      ),
                                      child: Icon(
                                        repeatPasswordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                                shape: BoxShape.rectangle,
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (passwordController.text !=
                                      repeatPasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Passwords don't match!",
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  final user = await createAccountWithEmail(
                                    context,
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  final usersCreateData = createUsersRecordData(
                                    displayName: nameController.text,
                                  );
                                  await UsersRecord.collection
                                      .doc(user.uid)
                                      .update(usersCreateData);

                                  final compartmentsCreateData1 =
                                    createCompartmentsRecordData(
                                      name: 'Compartement 1',
                                      user: currentUserReference,
                                      pills: ListBuilder(),
                                      index: 0,
                                    );
                                  await CompartmentsRecord.collection
                                    .doc()
                                    .set(compartmentsCreateData1);

                                  final compartmentsCreateData2 =
                                    createCompartmentsRecordData(
                                      name: 'Compartement 2',
                                      user: currentUserReference,
                                      pills: ListBuilder(),
                                      index: 1,
                                    );
                                  await CompartmentsRecord.collection
                                    .doc()
                                    .set(compartmentsCreateData2);

                                  final compartmentsCreateData3 =
                                  createCompartmentsRecordData(
                                    name: 'Compartement 3',
                                    user: currentUserReference,
                                    pills: ListBuilder(),
                                    index: 2,
                                  );
                                  await CompartmentsRecord.collection
                                    .doc()
                                    .set(compartmentsCreateData3);

                                  final compartmentsCreateData4 =
                                    createCompartmentsRecordData(
                                      name: 'Compartement 4',
                                      user: currentUserReference,
                                      pills: ListBuilder(),
                                      index: 3,
                                    );
                                  await CompartmentsRecord.collection
                                    .doc()
                                    .set(compartmentsCreateData4);

                                  final compartmentsCreateData5 =
                                    createCompartmentsRecordData(
                                      name: 'Compartement 5',
                                      user: currentUserReference,
                                      pills: ListBuilder(),
                                      index: 4,
                                    );
                                  await CompartmentsRecord.collection
                                    .doc()
                                    .set(compartmentsCreateData5);

                                  final compartmentsCreateData6 =
                            createCompartmentsRecordData(
                              name: 'Compartement 6',
                              user: currentUserReference,
                              pills: ListBuilder(),
                              index: 5,
                            );
                            await CompartmentsRecord.collection
                                .doc()
                                .set(compartmentsCreateData6);

                            final compartmentsCreateData7 =
                            createCompartmentsRecordData(
                              name: 'Compartement 7',
                              user: currentUserReference,
                              pills: ListBuilder(),
                              index: 6,
                            );
                            await CompartmentsRecord.collection
                                .doc()
                                .set(compartmentsCreateData7);

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddMedicinLinkWidget(),
                              ),
                            );
                          },
                          text: 'Maak account aan',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Heb je al een account?',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginWidget(),
                            ),
                          );
                        },
                        child: Text(
                          'Klik dan hier om in te loggen',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF54D6FF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
