import '/flutter_flow/flutter_flow_util.dart';
import 'like_posts_widget.dart' show LikePostsWidget;
import 'package:flutter/material.dart';

class LikePostsModel extends FlutterFlowModel<LikePostsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
