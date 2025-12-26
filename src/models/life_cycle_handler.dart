class LifeCycleHandler<V>{
  
  final void Function(V value)? onInit;
  final void Function(V value)? onDispose;
  final void Function(V value)? onDidChangeDependencies;
  final void Function(V value)? onDeactivate;

  LifeCycleHandler({
    this.onInit,
    this.onDispose,
    this.onDidChangeDependencies,
    this.onDeactivate,
  });
}