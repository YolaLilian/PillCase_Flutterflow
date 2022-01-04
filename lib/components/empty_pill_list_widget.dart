import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyPillListWidget extends StatefulWidget {
  const EmptyPillListWidget({Key key}) : super(key: key);

  @override
  _EmptyPillListWidgetState createState() => _EmptyPillListWidgetState();
}

class _EmptyPillListWidgetState extends State<EmptyPillListWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Er zijn geen pillen gepland voor vandaag',
      textAlign: TextAlign.center,
      style: FlutterFlowTheme.bodyText1.override(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
