import 'package:demo/riverpod/components/progress_percentuale_widget.dart';
import 'package:demo/riverpod/provider/riverpod_provider.dart';
import 'package:demo/riverpod/second_screen.dart';
import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstScreen extends ConsumerStatefulWidget {
  const FirstScreen({super.key});

  @override
  ConsumerState<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends ConsumerState<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    int percentuale = ref.watch(riverpodProvider).percentuale ?? 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24.sz(context),
          ),
        ),
        title: Text("Demo Riverpod"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          spacing: 10.sz(context),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 50.sz(context),
                child: ProgressPercentualeWidget(
                  percentuale: percentuale.toDouble(),
                  testoUnlock: '',
                  testoLock: '',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              child: Text(
                "Second screen",
                style: AppTexts.kButton.copyWith(
                  fontSize: 18.sp(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
