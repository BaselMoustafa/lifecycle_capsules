import 'package:flutter/material.dart';
import '../../models/life_cycle_handler.dart';
import '../base/object_capsule.dart';

/// A capsule that automatically disposes a [TextEditingController] when the
/// associated [CapsulesState] is disposed.
///
/// This capsule wraps a [TextEditingController] and ensures it is properly
/// disposed of when the widget is removed from the tree, preventing memory leaks.
///
/// Use [encapsulateTextEditingController] in [CapsulesState] to create an instance.
class TextEditingControllerCapsule
    extends ObjectCapsule<TextEditingController> {
  /// Creates a new [TextEditingControllerCapsule] with the given [value].
  const TextEditingControllerCapsule({
    required super.value,
  });

  @override
  LifecycleHandler get handler {
    return LifecycleHandler(onDispose: () => value.dispose());
  }
}
