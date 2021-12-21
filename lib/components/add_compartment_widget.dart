import '../add_compartment/add_compartment_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCompartmentWidget extends StatefulWidget {
  const AddCompartmentWidget({Key key}) : super(key: key);

  @override
  _AddCompartmentWidgetState createState() => _AddCompartmentWidgetState();
}

class _AddCompartmentWidgetState extends State<AddCompartmentWidget> {
  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddCompartmentWidget(),
          ),
        );
      },
      text: 'voeg compartement toe',
      options: FFButtonOptions(
        width: 300,
        height: 100,
        color: FlutterFlowTheme.secondaryColor,
        textStyle: FlutterFlowTheme.subtitle2.override(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: 10,
      ),
    );
  }
}
