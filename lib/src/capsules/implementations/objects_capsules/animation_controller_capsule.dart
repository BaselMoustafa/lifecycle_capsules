import 'package:flutter/material.dart';

import '../../../models/life_cycle_handler.dart';
import '../../base/object_capsule.dart';

/// A capsule that automatically disposes an [AnimationController] when the
/// associated [CapsulesState] is disposed.
///
/// This capsule wraps an [AnimationController] and ensures it is properly
/// disposed of when the widget is removed from the tree, preventing memory leaks.
///
/// Use [encapsulateAnimationController] in [CapsulesState] to create an instance.
class AnimationControllerCapsule extends ObjectCapsule<AnimationController> {
  /// Creates a new [AnimationControllerCapsule] with the given [value].
  const AnimationControllerCapsule({required super.value});

  @override
  LifecycleHandler get handler {
    return LifecycleHandler(onDispose: () => value.dispose());
  }
}
