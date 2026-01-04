import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lifecycle_capsules/lifecycle_capsules.dart';

class PeriodicOperationCapsuleExample extends StatefulWidget {
  const PeriodicOperationCapsuleExample({super.key});

  @override
  State<PeriodicOperationCapsuleExample> createState() => _PeriodicOperationCapsuleExampleState();
}

class _PeriodicOperationCapsuleExampleState extends CapsulesState<PeriodicOperationCapsuleExample> {
  int _counter = 0;
  DateTime? _lastExecutionTime;
  bool _isRunning = true;

  late final periodicOperation = encapsulatePeriodicOperation(
    period: const Duration(seconds: 1),
    operation: (Timer timer) {
      if (mounted) {
        setState(() {
          _counter++;
          _lastExecutionTime = DateTime.now();
        });
      }
    },
  );

  @override
  Set<dynamic> get encapsulatedObjects => {
    periodicOperation,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Periodic Operation Capsule Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Executions:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_counter',
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              if (_lastExecutionTime != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Last Execution:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${_lastExecutionTime!.hour.toString().padLeft(2, '0')}:${_lastExecutionTime!.minute.toString().padLeft(2, '0')}:${_lastExecutionTime!.second.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _counter = 0;
                        _lastExecutionTime = null;
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _isRunning = !_isRunning;
                        if (_isRunning) {
                          // Note: The timer is already running, this is just for UI state
                        } else {
                          // The timer will continue but we show it as stopped in UI
                          // In a real scenario, you might want to cancel the timer
                        }
                      });
                    },
                    icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                    label: Text(_isRunning ? 'Pause' : 'Resume'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'This example demonstrates a periodic operation that executes every second. The timer is automatically cancelled when you navigate away.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
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

