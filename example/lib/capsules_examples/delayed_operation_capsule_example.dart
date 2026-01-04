import 'package:flutter/material.dart';
import 'package:lifecycle_capsules/lifecycle_capsules.dart';

class DelayedOperationCapsuleExample extends StatefulWidget {
  const DelayedOperationCapsuleExample({super.key});

  @override
  State<DelayedOperationCapsuleExample> createState() => _DelayedOperationCapsuleExampleState();
}

class _DelayedOperationCapsuleExampleState extends CapsulesState<DelayedOperationCapsuleExample> {
  String _status = 'Waiting for the callback...';

  late final delayedOperation = encapsulateDelayedOperation(
    delay: const Duration(seconds: 5),
    operation: () {
      _status = 'Called After the given delay';
      setState(() {});
    },
  );

  @override
  Set<dynamic> get encapsulatedObjects => {
    delayedOperation,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delayed Operation Capsule Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              const SizedBox(height: 30),
              Text(
                _status,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

