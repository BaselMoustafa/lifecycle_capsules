import 'package:flutter/material.dart';

import 'type_extension.dart';

class ToCapsuleExampleScreenButton extends StatelessWidget {
  const ToCapsuleExampleScreenButton({super.key, required this.screen});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _navigateToScreen(context),
      child: Text("To ${screen.runtimeType.formattedName}"),
    );
  }

  void _navigateToScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

}