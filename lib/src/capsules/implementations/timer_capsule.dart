import 'dart:async';

import '../../models/life_cycle_handler.dart';
import '../base/object_capsule.dart';

/// A capsule that automatically cancels a [Timer] when the
/// associated [CapsulesState] is disposed.
///
/// This capsule wraps a [Timer] and ensures it is properly
/// cancelled when the widget is removed from the tree, preventing memory leaks.
///
/// Use [encapsulateTimer] or [encapsulatePeriodicTimer] in [CapsulesState] to create an instance.
class TimerCapsule extends ObjectCapsule<Timer> {
  /// Creates a new [TimerCapsule] with the given [value].
  const TimerCapsule({
    required super.value,
  });

  @override
  LifecycleHandler get handler {
    return LifecycleHandler(onDispose: () => value.cancel());
  }
}

