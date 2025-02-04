import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/stateless_stateful/stateful_screen.dart';
import 'package:demo/stateless_stateful/stateless_screen.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class StatelessStatefulScreen extends StatelessWidget {
  const StatelessStatefulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stateless vs Stateful",
          style: AppTexts.kAppBar.copyWith(fontSize: 20.sp(context)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: StatelessScreen()),
          Divider(),
          Expanded(child: StatefulScreen()),
        ],
      ),
    );
  }
}
