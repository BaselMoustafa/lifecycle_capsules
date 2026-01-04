import 'package:flutter/widgets.dart';
import '../../../lifecycle_capsules.dart';

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
class ListenerCapsule<Source extends Listenable>
    extends LifeCycleCapsule {
  /// The [Listenable] source to which the listener will be added.
  final Source source;
  final VoidCallback listener;

  /// Creates a new [ListenerCapsule] with the given [source] and [value] (listener).
  const ListenerCapsule({
    required this.source, 
    required this.listener, 
  });

  @override
  LifecycleHandler get handler => LifecycleHandler(
    onInit: () => source.addListener(listener),
    onDispose: () => source.removeListener(listener),
  );
}
