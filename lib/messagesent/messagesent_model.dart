import '/flutter_flow/flutter_flow_util.dart';
import 'messagesent_widget.dart' show MessagesentWidget;
import 'package:flutter/material.dart';

class MessagesentModel extends FlutterFlowModel<MessagesentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
