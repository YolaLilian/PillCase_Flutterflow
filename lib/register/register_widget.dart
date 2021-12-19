import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController repeatPasswordController;
  bool repeatPasswordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    repeatPasswordController = TextEditingController();
    repeatPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Text(
              'Maak Account',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
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
                  Container(
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
                        hintText: '  E-mail...',
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
                      ),
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
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
                  Container(
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
                        hintText: '  Wachtwoord...',
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
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
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
                  Container(
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
                        hintText: '  Wachtwoord...',
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
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

                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'MAAK ACCOUNT',
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
                      ),
                    ),
                  ),
                  Text(
                    'Klik dan hier om in te loggen',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
