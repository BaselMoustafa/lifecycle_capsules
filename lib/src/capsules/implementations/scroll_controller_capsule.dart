import 'package:flutter/material.dart';

import '../../models/life_cycle_handler.dart';
import '../base/object_capsule.dart';

/// A capsule that automatically disposes a [ScrollController] when the
/// associated [CapsulesState] is disposed.
///
/// This capsule wraps a [ScrollController] and ensures it is properly
/// disposed of when the widget is removed from the tree, preventing memory leaks.
///
/// Use [encapsulateScrollController] in [CapsulesState] to create an instance.
class ScrollControllerCapsule extends ObjectCapsule<ScrollController> {
  /// Creates a new [ScrollControllerCapsule] with the given [value].
  const ScrollControllerCapsule({
    required super.value,
  });

  @override
  LifecycleHandler get handler {
    return LifecycleHandler(onDispose: () => value.dispose());
  }
}

