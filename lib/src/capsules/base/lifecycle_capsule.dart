import '../../models/life_cycle_handler.dart';

/// The base capsule that manages the lifecycle of objects and operations.
///
/// All capsule types must extend this base class.
/// This class provides a unified interface for lifecycle management through [handler].
///
/// See also:
/// - [ObjectCapsule] for capsules that contain objects
/// - [OperationCapsule] for capsules that contain operations
abstract class LifeCycleCapsule {
  /// Creates a new lifecycle capsule.
  const LifeCycleCapsule();

  /// The lifecycle handler that contains functions invoked at different stages
  /// of the State's lifecycle.
  LifecycleHandler get handler;
}
