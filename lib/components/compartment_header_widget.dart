import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompartmentHeaderWidget extends StatefulWidget {
  const CompartmentHeaderWidget({
    Key key,
    this.compartmentName,
    this.compartmentTime,
    this.compartmentIcon,
  }) : super(key: key);

  final String compartmentName;
  final String compartmentTime;
  final Widget compartmentIcon;

  @override
  _CompartmentHeaderWidgetState createState() =>
      _CompartmentHeaderWidgetState();
}

class _CompartmentHeaderWidgetState extends State<CompartmentHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Compartement name',
          style: FlutterFlowTheme.bodyText1,
        ),
        Text(
          'Hello World',
          style: FlutterFlowTheme.bodyText1,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(38, 0, 0, 0),
          child: Icon(
            Icons.settings_outlined,
            color: Colors.black,
            size: 24,
          ),
        ),
      ],
    );
  }
}
