import 'dart:async';
import '../../../lifecycle_capsules.dart';

/// A capsule that executes an operation after a specified delay.
///
/// This capsule creates a one-shot timer that executes the provided operation
/// after the specified duration. The timer is automatically cancelled when
/// the associated [CapsulesState] is disposed.
///
/// Use [encapsulateDelayedOperation] in [CapsulesState] to create an instance.
class DelayedOperationCapsule extends LifeCycleCapsule {
  
  final Duration delay;
  final void Function() operation;
  
  DelayedOperationCapsule({
    required this.delay,
    required this.operation,
  });

  late final _timerCapsule =Timer(delay, operation);

  @override
  LifecycleHandler get handler => LifecycleHandler(
    onInit: () => _timerCapsule,
    onDispose: () => _timerCapsule.cancel(),
  );
}

