import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class AddFirstPillButtonWidget extends StatefulWidget {
  const AddFirstPillButtonWidget({Key key}) : super(key: key);

  @override
  _AddFirstPillButtonWidgetState createState() =>
      _AddFirstPillButtonWidgetState();
}

class _AddFirstPillButtonWidgetState extends State<AddFirstPillButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'Add First Pill',
      options: FFButtonOptions(
        width: double.infinity,
        height: 44,
        color: Color(0xFF00D43B),
        textStyle: FlutterFlowTheme.subtitle2.override(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: 12,
      ),
    );
  }
}
