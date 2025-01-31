import 'package:demo/buttons/buttons_screen.dart';
import 'package:demo/riverpod/riverpod_first_screen.dart';
import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/stateless_stateful/stateless_stateful_screen.dart';
import 'package:demo/text/texts_screen.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista degli schermi con nome e relativo widget
    final List<Map<String, dynamic>> screens = [
      {'type': 'Buttons', 'screen': ButtonsScreen()},
      {'type': 'Texts', 'screen': TextsScreen()},
      {'type': 'Stateless vs Stateful', 'screen': StatelessStatefulScreen()},
      {'type': 'Riverpod', 'screen': RiverpodFirstScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Flutter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: ListView.builder(
            itemCount: screens.length,
            itemBuilder: (context, index) {
              final screen = screens[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                title: Text(
                  screen['type'],
                  style: AppTexts.kButton.copyWith(
                    fontSize: 20.sp(context),
                  ),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => screen['screen'],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
