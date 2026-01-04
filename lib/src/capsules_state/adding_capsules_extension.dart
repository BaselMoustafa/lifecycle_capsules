import 'dart:async';

import 'package:flutter/cupertino.dart';
import '../capsules/implementations/animation_controller_capsule.dart';
import '../capsules/implementations/delayed_operation_capsule.dart';
import '../capsules/implementations/listener_capsule.dart';
import '../capsules/implementations/page_controller_capsule.dart';
import '../capsules/implementations/periodic_operation_capsule.dart';
import '../capsules/implementations/scroll_controller_capsule.dart';
import '../capsules/implementations/text_editing_controller_capsule.dart';
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
  }) => addObjectCapsule(
    capsule: TextEditingControllerCapsule(
      value: TextEditingController(text: initialValue),
    ),
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
  }) => addObjectCapsule<AnimationController>(
    capsule: AnimationControllerCapsule(
      value: AnimationController(
        value: value,
        vsync: vsync ?? this,
        duration: duration ?? const Duration(milliseconds: 500),
        reverseDuration: reverseDuration,
        lowerBound: lowerBound ?? 0,
        upperBound: upperBound ?? 1,
        animationBehavior: animationBehavior ?? AnimationBehavior.normal,
      ),
    ),
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
  ListenerCapsule encapsulateListener<Source extends Listenable>({
    required Source source,
    required VoidCallback listener,
  }) => addCapsule(
    capsule: ListenerCapsule<Source>( 
      source: source, 
      listener: listener,
    ),
  );

  /// Creates and encapsulates a [PageController] that will be
  /// automatically disposed when the State is disposed.
  ///
  /// The controller is wrapped in a [PageControllerCapsule] and
  /// registered for automatic lifecycle management.
  ///
  /// **Important:** The returned controller must be included in the
  /// [encapsulatedObjects] set.
  ///
  /// Example:
  /// ```dart
  /// late final pageController = encapsulatePageController(
  ///   initialPage: 0,
  ///   viewportFraction: 0.8,
  ///   onAttach: (ScrollPosition position) => print('Attached'),
  ///   onDetach: (ScrollPosition position) => print('Detached'),
  /// );
  ///
  /// @override
  /// Set<dynamic> get encapsulatedObjects => {pageController};
  /// ```
  ///
  /// See also:
  /// - [PageControllerCapsule] for the underlying capsule implementation
  PageController encapsulatePageController({
    int? initialPage,
    bool keepPage = true,
    double viewportFraction = 1.0,
    void Function(ScrollPosition)? onAttach,
    void Function(ScrollPosition)? onDetach,
  }) => addObjectCapsule<PageController>(
    capsule: PageControllerCapsule(
      value: PageController(
        initialPage: initialPage ?? 0,
        keepPage: keepPage,
        viewportFraction: viewportFraction,
        onAttach: onAttach,
        onDetach: onDetach,
      ),
    ),
  );

  /// Creates and encapsulates a [ScrollController] that will be
  /// automatically disposed when the State is disposed.
  ///
  /// The controller is wrapped in a [ScrollControllerCapsule] and
  /// registered for automatic lifecycle management.
  ///
  /// **Important:** The returned controller must be included in the
  /// [encapsulatedObjects] set.
  ///
  /// Example:
  /// ```dart
  /// late final scrollController = encapsulateScrollController(
  ///   initialScrollOffset: 0.0,
  ///   onAttach: (ScrollPosition position) => print('Attached'),
  ///   onDetach: (ScrollPosition position) => print('Detached'),
  /// );
  ///
  /// @override
  /// Set<dynamic> get encapsulatedObjects => {scrollController};
  /// ```
  ///
  /// See also:
  /// - [ScrollControllerCapsule] for the underlying capsule implementation
  ScrollController encapsulateScrollController({
    double initialScrollOffset = 0.0,
    bool keepScrollOffset = true,
    String? debugLabel,
    void Function(ScrollPosition)? onAttach,
    void Function(ScrollPosition)? onDetach,
  }) => addObjectCapsule<ScrollController>(
    capsule: ScrollControllerCapsule(
      value: ScrollController(
        initialScrollOffset: initialScrollOffset,
        keepScrollOffset: keepScrollOffset,
        debugLabel: debugLabel,
        onAttach: onAttach,
        onDetach: onDetach,
      ),
    ),
  );


  /// Creates and encapsulates a periodic [Timer] that will be
  /// automatically cancelled when the State is disposed.
  ///
  /// The timer is wrapped in a [TimerCapsule] and registered for
  /// automatic lifecycle management.
  ///
  /// This creates a periodic timer that fires repeatedly at the specified [period].
  /// The callback receives the timer instance as a parameter.
  ///
  /// **Important:** The returned timer must be included in the
  /// [encapsulatedObjects] set.
  ///
  /// Example:
  /// ```dart
  /// late final periodicTimer = encapsulatePeriodicTimer(
  ///   period: Duration(seconds: 1),
  ///   callback: (Timer timer) {
  ///     print('Timer tick: ${DateTime.now()}');
  ///   },
  /// );
  ///
  /// @override
  /// Set<dynamic> get encapsulatedObjects => {periodicTimer};
  /// ```
  ///
  /// See also:
  /// - [TimerCapsule] for the underlying capsule implementation
  /// - [encapsulateTimer] for creating a one-shot timer
  PeriodicOperationCapsule encapsulatePeriodicOperation({
    required Duration period,
    required void Function(Timer timer) operation,
  }) => addCapsule(
    capsule: PeriodicOperationCapsule(
      period: period,
      operation: operation,
    ),
  );

  /// Creates and encapsulates a delayed operation that will be
  /// automatically cancelled when the State is disposed.
  ///
  /// The operation is wrapped in a [DelayedOperationCapsule] and registered for
  /// automatic lifecycle management.
  ///
  /// This creates a one-shot timer that executes the provided [operation]
  /// after the specified [delay]. The timer is automatically cancelled if
  /// the widget is disposed before the delay expires.
  ///
  /// **Important:** The returned capsule must be included in the
  /// [encapsulatedObjects] set.
  ///
  /// Example:
  /// ```dart
  /// late final delayedOperation = encapsulateDelayedOperation(
  ///   delay: Duration(seconds: 5),
  ///   operation: () {
  ///     print('Operation executed after 5 seconds!');
  ///   },
  /// );
  ///
  /// @override
  /// Set<dynamic> get encapsulatedObjects => {delayedOperation};
  /// ```
  ///
  /// See also:
  /// - [DelayedOperationCapsule] for the underlying capsule implementation
  DelayedOperationCapsule encapsulateDelayedOperation({
    required Duration delay,
    required void Function() operation,
  }) => addCapsule(
    capsule: DelayedOperationCapsule(
      delay: delay,
      operation: operation,
    ),
  );
}
