import 'package:flutter/widgets.dart';
import '../../../../lifecycle_capsules.dart';

/// A capsule that automatically adds a listener to a [Listenable] source in
/// [State.initState] and removes it in [State.dispose].
///
/// This capsule works with any source that extends [Listenable], such as
/// [AnimationController], [Animation], [TextEditingController], etc.
///
/// The listener is automatically added when the State is initialized and
/// removed when the State is disposed, preventing memory leaks and ensuring
/// proper cleanup.
///
/// Use [encapsulateListener] in [CapsulesState] to create an instance.
class ListenerCapsule<Source extends Listenable> extends ObjectCapsule<VoidCallback> {
  
  /// The [Listenable] source to which the listener will be added.
  final Source source;

  /// Creates a new [ListenerCapsule] with the given [source] and [value] (listener).
  const ListenerCapsule({
    required this.source,
    required super.value, 
  });
  
  @override
  LifecycleHandler get handler =>LifecycleHandler(
    onInit: ()=> source.addListener(
      value,
    ),
    onDispose: ()=> source.removeListener(
      value,
    ),
  );
  
}