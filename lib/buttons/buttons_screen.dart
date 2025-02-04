import 'package:demo/riverpod/utils/responsive_extensions.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demo Buttons',
          style: AppTexts.kAppBar
              .copyWith(fontSize: 20.sp(context), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Elevated Button'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Outlined Button'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Text Button'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: Colors.red),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.send),
                label: Text('Button with Icon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
