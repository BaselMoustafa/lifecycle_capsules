import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lifecycle_capsules/lifecycle_capsules.dart';

class TextEditingControllerCapsuleExample extends StatefulWidget {
  const TextEditingControllerCapsuleExample({super.key});

  @override
  State<TextEditingControllerCapsuleExample> createState() => _TextEditingControllerCapsuleExampleState();
}

class _TextEditingControllerCapsuleExampleState extends CapsulesState<TextEditingControllerCapsuleExample> {

  late final nameController = encapsulateTextEditingController(
    value: TextEditingController(
      text: "Basel Moustafa",
    ),
  );

  late final TextEditingController emailController = encapsulateTextEditingController(
    value: TextEditingController(),
  );

  @override
  Set<dynamic> get encapsulatedObjects=> {
    nameController,
    emailController,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Editing Controller Capsule Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 15,
          children: [
            TextField(
              controller: nameController,
            ),

            TextField(
              controller: emailController,
            ),

            ElevatedButton(
              onPressed: () {
                log("Name: ${nameController.value.text}");
                log("Email: ${emailController.value.text}");
              },
              child: Text('Get Values'),
            ),
          ],
        ),
      ),
    );
  }
}

