import '/flutter_flow/flutter_flow_util.dart';
import 'lost_found_widget.dart' show LostFoundWidget;
import 'package:flutter/material.dart';

class LostFoundModel extends FlutterFlowModel<LostFoundWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
