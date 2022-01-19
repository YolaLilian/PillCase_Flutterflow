import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CompartmentHeaderWidget extends StatefulWidget {
  const CompartmentHeaderWidget({
    Key key,
    this.compartementName,
    this.compartementTime,
  }) : super(key: key);

  final String compartementName;
  final String compartementTime;

  @override
  _CompartmentHeaderWidgetState createState() =>
      _CompartmentHeaderWidgetState();
}

class _CompartmentHeaderWidgetState extends State<CompartmentHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.compartementName.maybeHandleOverflow(
            maxChars: 22,
            replacement: '…',
          ),
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            fontSize: 24,
          ),
        ),
        Text(
          widget.compartementTime.maybeHandleOverflow(
            maxChars: 22,
            replacement: '…',
          ),
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
