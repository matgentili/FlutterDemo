import 'package:demo/riverpod/provider/riverpod_provider.dart';
import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodSecondScreen extends ConsumerStatefulWidget {
  const RiverpodSecondScreen({super.key});

  @override
  ConsumerState<RiverpodSecondScreen> createState() =>
      _RiverpodSecondScreenState();
}

class _RiverpodSecondScreenState extends ConsumerState<RiverpodSecondScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        title: Text(
          "Riverpod",
          style: AppTexts.kAppBar.copyWith(fontSize: 20.sp(context)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.sz(context),
          children: [
            Text(
              "Percentuale: $percentuale",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24.sp(context)),
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
                    ref.read(riverpodProvider.notifier).updateModel(
                        percentuale: (percentuale + 10).clamp(0, 100));
                  },
                  child: Text(
                    "Add + 10",
                    style: AppTexts.kButton.copyWith(
                      fontSize: 18.sp(context),
                    ),
                  )),
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
                  ref
                      .read(riverpodProvider.notifier)
                      .updateModel(percentuale: 0);
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
