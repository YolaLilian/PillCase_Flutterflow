import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PillWidget extends StatefulWidget {
  const PillWidget({
    Key key,
    this.compartmentName,
    this.compartmentTime,
    this.pillName,
    this.compartmentIcon,
  }) : super(key: key);

  final String compartmentName;
  final String compartmentTime;
  final String pillName;
  final Widget compartmentIcon;

  @override
  _PillWidgetState createState() => _PillWidgetState();
}

class _PillWidgetState extends State<PillWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 18,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF5F5F5F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(0),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-0.1, 0),
                  child: Text(
                    widget.pillName,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
