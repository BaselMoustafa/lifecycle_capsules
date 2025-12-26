class LifecycleHandler{
  
  final void Function()? onInit;
  final void Function()? onDispose;
  final void Function()? onDidChangeDependencies;
  final void Function()? onDeactivate;

  LifecycleHandler({
    this.onInit,
    this.onDispose,
    this.onDidChangeDependencies,
    this.onDeactivate,
  });

}