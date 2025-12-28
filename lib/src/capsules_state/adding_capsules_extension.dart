import 'package:flutter/cupertino.dart';
import '../capsules/implementations/objects_capsules/animation_controller_capsule.dart';
import '../capsules/implementations/objects_capsules/listener_capsule.dart';
import '../capsules/implementations/objects_capsules/text_editing_controller_capsule.dart';
import 'capsules_state.dart';

/// Extension methods for [CapsulesState] that provide convenient ways to
/// create and encapsulate common Flutter objects.
///
/// These methods automatically wrap objects in appropriate capsules and
/// register them for lifecycle management.
extension AddingCapsulesExtension on CapsulesState {

  /// Creates and encapsulates a [TextEditingController] that will be
  /// automatically disposed when the State is disposed.
  ///
  /// The controller is wrapped in a [TextEditingControllerCapsule] and
  /// registered for automatic lifecycle management.
  ///
  /// **Important:** The returned controller must be included in the
  /// [encapsulatedObjects] set.
  ///
  /// Example:
  /// ```dart
  /// late final nameController = encapsulateTextEditingController(
  ///   initialValue: "Default text",
  /// );
  ///
  /// @override
  /// Set<dynamic> get encapsulatedObjects => {nameController};
  /// ```
  ///
  /// See also:
  /// - [TextEditingControllerCapsule] for the underlying capsule implementation
  TextEditingController encapsulateTextEditingController({
    String? initialValue,
  })=>addObjectCapsule(
    capsule: TextEditingControllerCapsule(
      value: TextEditingController(
        text: initialValue,
      ),
    )
  );

  /// Creates and encapsulates an [AnimationController] that will be
  /// automatically disposed when the State is disposed.
  ///
  /// The controller is wrapped in an [AnimationControllerCapsule] and
  /// registered for automatic lifecycle management.
  ///
  /// If [vsync] is not provided, the current [CapsulesState] instance
  /// (which includes [TickerProviderStateMixin]) is used as the vsync.
  ///
  /// **Important:** The returned controller must be included in the
  /// [encapsulatedObjects] set.
  ///
  /// Example:
  /// ```dart
  /// late final animationController = encapsulateAnimationController(
  ///   duration: Duration(seconds: 2),
  /// );
  ///
  /// @override
  /// Set<dynamic> get encapsulatedObjects => {animationController};
  /// ```
  ///
  /// See also:
  /// - [AnimationControllerCapsule] for the underlying capsule implementation
  AnimationController encapsulateAnimationController({
    TickerProvider? vsync,
    Duration? duration,
    Duration? reverseDuration,
    double? lowerBound,
    double? upperBound,
    AnimationBehavior? animationBehavior,
    double? value,
  })=>addObjectCapsule(
    capsule: AnimationControllerCapsule(
      value: AnimationController(
        value: value,
        vsync: vsync?? this,
        duration: duration?? const Duration(milliseconds: 500),
        reverseDuration: reverseDuration,
        lowerBound: lowerBound?? 0,
        upperBound: upperBound?? 1,
        animationBehavior: animationBehavior?? AnimationBehavior.normal,
      ),
    )
  );

  /// Encapsulates a listener that will be automatically added to a [Listenable]
  /// source in [State.initState] and removed in [State.dispose].
  ///
  /// The listener is wrapped in a [ListenerCapsule] and registered for
  /// automatic lifecycle management.
  ///
  /// This works with any source that extends [Listenable], such as
  /// [AnimationController], [Animation], [TextEditingController], etc.
  ///
  /// **Important:** The returned callback must be included in the
  /// [encapsulatedObjects] set.
  ///
  /// Example:
  /// ```dart
  /// late final listener = encapsulateListener<AnimationController>(
  ///   source: animationController,
  ///   listener: () => print('Animation value changed'),
  /// );
  ///
  /// @override
  /// Set<dynamic> get encapsulatedObjects => {listener};
  /// ```
  ///
  /// See also:
  /// - [ListenerCapsule] for the underlying capsule implementation
  VoidCallback encapsulateListener<Source extends Listenable>({
    required Source source,
    required VoidCallback listener,
  })=>addObjectCapsule(
    capsule:  ListenerCapsule<Source>(
      source: source,
      value: listener,
    )
  );
}