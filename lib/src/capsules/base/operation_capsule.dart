import 'lifecycle_capsule.dart';

/// A capsule that wraps an operation and manages its lifecycle.
///
/// This capsule type is used for operations that need lifecycle management,
/// such as listeners, subscriptions, or other operations that need to be
/// set up in [State.initState] and cleaned up in [State.dispose].
///
/// The operation source is accessible through the [source] property.
abstract class OperationCapsule<Source> extends LifeCycleCapsule {
  /// The source of the operation that this capsule manages.
  final Source source;

  /// Creates a new operation capsule with the given [source].
  const OperationCapsule({required this.source});
}
