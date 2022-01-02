import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCompartmentListWidget extends StatefulWidget {
  const EmptyCompartmentListWidget({Key key}) : super(key: key);

  @override
  _EmptyCompartmentListWidgetState createState() =>
      _EmptyCompartmentListWidgetState();
}

class _EmptyCompartmentListWidgetState
    extends State<EmptyCompartmentListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'Deze dag heeft \ngeen compartementen \ningepland staan...',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.subtitle1.override(
                fontFamily: 'Poppins',
                color: Color(0xFF5F5F5F),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
