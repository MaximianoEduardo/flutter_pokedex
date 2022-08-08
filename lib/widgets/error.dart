import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error)),
    );
  }
}
