import '/flutter_flow/flutter_flow_util.dart';
import 'training_widget.dart' show TrainingWidget;
import 'package:flutter/material.dart';

class TrainingModel extends FlutterFlowModel<TrainingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
