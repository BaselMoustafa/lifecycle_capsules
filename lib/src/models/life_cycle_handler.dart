/// A lifecycle handler that contains callback functions invoked at different stages
/// of the State's lifecycle.
///
/// This handler is used by [LifeCycleCapsule] to execute operations at the appropriate
/// times during the widget's lifecycle.
class LifecycleHandler{
  
  /// A function invoked in [State.initState].
  ///
  /// Used to perform initialization operations when the State is created.
  final void Function()? onInit;
  
  /// A function invoked in [State.dispose].
  ///
  /// Used to clean up and release resources when the State is disposed.
  final void Function()? onDispose;
  
  /// A function invoked in [State.didChangeDependencies].
  ///
  /// Used to perform operations when the State's dependencies change.
  final void Function()? onDidChangeDependencies;
  
  /// A function invoked in [State.deactivate].
  ///
  /// Used to perform operations when the State is deactivated.
  final void Function()? onDeactivate;

  /// Creates a new lifecycle handler.
  ///
  /// All parameters are optional and can be null.
  LifecycleHandler({
    this.onInit,
    this.onDispose,
    this.onDidChangeDependencies,
    this.onDeactivate,
  });

}