import 'package:auth_flow_test/src/common/extensions/widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.error,
  }) : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoSizeText(error).list().center(),
    );
  }
}
