import 'package:demo/riverpod/components/liquid_linear_progress_indicator.dart';
import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class ProgressPercentualeWidget extends StatelessWidget {
  const ProgressPercentualeWidget(
      {super.key,
      required this.percentuale,
      required this.testoUnlock,
      required this.testoLock,
      this.valueColor,
      this.backgroundColor,
      this.borderColor,
      this.textColor});

  final double percentuale;
  final String testoUnlock;
  final String testoLock;
  final Color? valueColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    late ValueNotifier<double> level;
    double progress = (percentuale / 100).clamp(0.0, 1.0);

// Se il livello corrente è maggiore o uguale a quello di sblocco, impostiamo la progressione al 100%
    if (progress >= 1.0) {
      // imposto 1.2 per non vedere ondulare la progress
      level = ValueNotifier<double>(1.2); // Progressione completa
    } else if (progress == 0.0) {
      // imposto -0.2 per non vedere ondulare la progress
      level = ValueNotifier<double>(-0.2);
    } else {
      level = ValueNotifier<double>(progress); // Calcola la progressione
    }
    final int percentualeLivello = (percentuale * 1).toInt();
    return Stack(
      children: [
        LiquidLinearProgressIndicator(
          progress: level,
          valueColor: AlwaysStoppedAnimation(
              Colors.green), // Defaults to the current Theme's accentColor.
          backgroundColor:
              Colors.white, // Defaults to the current Theme's backgroundColor.
          borderColor: Colors.green[700],
          borderWidth: 1.0.sz(context),
          borderRadius: 12.0.sz(context),
          direction: Axis
              .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
          center: FittedBox(
            fit: BoxFit.scaleDown,
            child: percentuale >= 101
                ? Text(
                    testoUnlock,
                  )
                : Text(
                    "$testoLock $percentualeLivello%",
                    style: AppTexts.kPercentuale
                        .copyWith(fontSize: 20.sp(context)),
                  ),
          ),
        ),
      ],
    );
  }
}
