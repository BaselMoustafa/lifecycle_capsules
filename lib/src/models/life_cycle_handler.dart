class LifecycleHandler<LifecycleHandlerValue>{
  
  final void Function(LifecycleHandlerValue value)? onInit;
  final void Function(LifecycleHandlerValue value)? onDispose;
  final void Function(LifecycleHandlerValue value)? onDidChangeDependencies;
  final void Function(LifecycleHandlerValue value)? onDeactivate;

  LifecycleHandler({
    this.onInit,
    this.onDispose,
    this.onDidChangeDependencies,
    this.onDeactivate,
  });

}