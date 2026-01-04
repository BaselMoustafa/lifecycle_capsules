import 'package:flutter/material.dart';
import '../../lifecycle_capsules.dart';

/// A State class that manages lifecycle capsules for automatic resource management.
///
/// Extend this class instead of [State] to use lifecycle capsules. This class
/// automatically handles the lifecycle of all registered capsules, calling their
/// appropriate handlers at the right times.
///
/// **Important:** You must override [encapsulatedObjects] and include all objects
/// that have been encapsulated using the helper methods.
///
/// Example:
/// ```dart
/// class _MyWidgetState extends CapsulesState<MyWidget> {
///   late final controller = encapsulateTextEditingController();
///
///   @override
///   Set<dynamic> get encapsulatedObjects => {controller};
/// }
/// ```
abstract class CapsulesState<WidgetType extends StatefulWidget> extends State<WidgetType>
    with TickerProviderStateMixin {
  /// Internal set of all registered lifecycle capsules.
  final Set<LifeCycleCapsule> _capsules = {};

  /// The set of all encapsulated objects that should be included in lifecycle management.
  ///
  /// **Must be overridden** to include all objects created using encapsulation methods
  /// such as [encapsulateTextEditingController], [encapsulateAnimationController], etc.
  Set<dynamic> get encapsulatedObjects;

  @override
  void initState() {
    super.initState();
    // Access all encapsulated objects to ensure they are initialized
    for (var object in encapsulatedObjects) {
      object;
    }
    // Call onInit handlers for all capsules
    for (var capsule in _capsules) {
      capsule.handler.onInit?.call();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var attribute in _capsules) {
      attribute.handler.onDidChangeDependencies?.call();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    for (var attribute in _capsules) {
      attribute.handler.onDeactivate?.call();
    }
  }

  @override
  void dispose() {
    // Call onDispose handlers for all capsules before disposing
    for (var attribute in _capsules) {
      attribute.handler.onDispose?.call();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(WidgetType oldWidget) {
    super.didUpdateWidget(oldWidget);
    for (var attribute in _capsules) {
      attribute.handler.onDidUpdateWidget?.call(oldWidget, widget);
    }
  }

  /// Adds a capsule to the lifecycle management system.
  ///
  /// This method registers the [capsule] and returns a value created by [valueFactory].
  ///
  /// Typically used internally by helper methods. Consider using [addObjectCapsule]
  /// or [addOperationCapsule] instead for type safety.
  CapsuleType addCapsule<CapsuleType extends LifeCycleCapsule>({
    required CapsuleType capsule,
  }) {
    _capsules.add(capsule);
    return capsule;
  }

  /// Adds an [ObjectCapsule] to the lifecycle management system.
  ///
  /// Returns the wrapped value from the capsule.
  ///
  /// This method is typically used internally by extension methods like
  /// [encapsulateTextEditingController].
  Value addObjectCapsule<Value>({
    required ObjectCapsule<Value> capsule,
  }){
    addCapsule(capsule: capsule);
    return capsule.value;
  }
}
