import 'package:demo/riverpod/first_screen.dart';
import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Demo Flutter",
          style: AppTexts.kAppBar.copyWith(fontSize: 20.sp(context)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        horizontal: 20.sz(context),
                        vertical: 10.sz(context)), // Padding interno
                  ),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.grey.shade300),
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => FirstScreen(),
                  ),
                ),
                child: Text(
                  "Demo Riverpod",
                  style: AppTexts.kButton.copyWith(
                    fontSize: 18.sp(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
