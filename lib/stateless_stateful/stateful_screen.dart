import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Stateful",
          style: AppTexts.kAppBar.copyWith(
              fontSize: 20.sp(context), fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          spacing: 20.sz(context),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "counter: $counter",
              style: AppTexts.kCounter.copyWith(fontSize: 20.sp(context)),
            ),
            SizedBox(
              width: width * 0.3,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        horizontal: 20.sz(context),
                        vertical: 10.sz(context)), // Padding interno
                  ),
                ),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                  debugPrint("Stateful counter: $counter");
                },
                child: Text(
                  "Add +1",
                  style: AppTexts.kButton.copyWith(
                    fontSize: 18.sp(context),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.3,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        horizontal: 20.sz(context),
                        vertical: 10.sz(context)), // Padding interno
                  ),
                ),
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                  debugPrint("Stateful counter: $counter");
                },
                child: Text(
                  "Reset",
                  style: AppTexts.kButton.copyWith(
                    fontSize: 18.sp(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
