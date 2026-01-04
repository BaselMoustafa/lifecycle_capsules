import 'dart:async';
import '../../../lifecycle_capsules.dart';

class PeriodicOperationCapsule extends LifeCycleCapsule {
  
  final Duration period;
  final void Function(Timer timer) operation;
  
  PeriodicOperationCapsule({
    required this.period,
    required this.operation,
  });

  late final _timer = Timer.periodic(
    period, 
    operation,
  );

  @override
  LifecycleHandler get handler => LifecycleHandler(
    onDispose: () => _timer.cancel(),
  );
}