import 'package:flutter/cupertino.dart';

import '../../models/life_cycle_handler.dart';
abstract class LifeCycleCapsule<Value,LifeCycleValue> {
  
  final Value value;

  final LifeCycleHandler<LifeCycleValue>? lifeCycleHandler;
  
  @protected
  final LifeCycleValue lifeCycleValue;

  const LifeCycleCapsule({
    required this.value,
    required this.lifeCycleValue,
    required this.lifeCycleHandler,
  });

  @protected
  LifeCycleHandler<LifeCycleValue> get baseHandler;

  void onInit() => _effectiveHandler?.onInit?.call(lifeCycleValue); 

  void onDidChangeDependencies() => _effectiveHandler?.onDidChangeDependencies?.call(lifeCycleValue);

  void onDeactivate() => _effectiveHandler?.onDeactivate?.call(lifeCycleValue);

  void onDispose() => _effectiveHandler?.onDispose?.call(lifeCycleValue);
  
  LifeCycleHandler<LifeCycleValue>? get _effectiveHandler => LifeCycleHandler<LifeCycleValue>(
    onInit: lifeCycleHandler?.onInit ?? baseHandler.onInit,
    onDidChangeDependencies: lifeCycleHandler?.onDidChangeDependencies ?? baseHandler.onDidChangeDependencies,
    onDeactivate: lifeCycleHandler?.onDeactivate ?? baseHandler.onDeactivate,
    onDispose: lifeCycleHandler?.onDispose ?? baseHandler.onDispose,
  );
}



