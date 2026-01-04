import 'package:flutter/material.dart';

import '../../../lifecycle_capsules.dart';

/// A capsule that wraps an object and manages its lifecycle.
///
/// This capsule type is used for objects that need lifecycle management,
/// such as [TextEditingController], [AnimationController], etc.
///
/// The wrapped object is accessible through the [value] property.
///
/// Example implementations:
/// - [TextEditingControllerCapsule]
/// - [AnimationControllerCapsule]
/// - [ListenerCapsule]
abstract class ObjectCapsule<Value> extends LifeCycleCapsule {
  /// The wrapped object that this capsule manages.
  final Value value;

  /// Creates a new object capsule with the given [value].
  const ObjectCapsule({
    required this.value, 
  });
}
