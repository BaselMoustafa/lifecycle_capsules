import 'package:flutter/cupertino.dart';

import '../../models/life_cycle_handler.dart';
abstract class LifeCycleCapsule<Value,LifecycleValue> {
  
  final Value value;

  final LifecycleHandler<LifecycleValue>? lifecycleHandler;
  
  @protected
  final LifecycleValue lifecycleValue;

  const LifeCycleCapsule({
    required this.value,
    required this.lifecycleValue,
    required this.lifecycleHandler,
  });

  @protected
  LifecycleHandler<LifecycleValue> get baseHandler;

  void onInit(){
    baseHandler.onInit?.call(lifecycleValue);
    lifecycleHandler?.onInit?.call(lifecycleValue);
  }

  void onDidChangeDependencies(){
    baseHandler.onDidChangeDependencies?.call(lifecycleValue);
    lifecycleHandler?.onDidChangeDependencies?.call(lifecycleValue);
  }

  void onDeactivate(){
    lifecycleHandler?.onDeactivate?.call(lifecycleValue);
    baseHandler.onDeactivate?.call(lifecycleValue);
  }

  void onDispose(){
    lifecycleHandler?.onDispose?.call(lifecycleValue);
    baseHandler.onDispose?.call(lifecycleValue);
  }
  
}
