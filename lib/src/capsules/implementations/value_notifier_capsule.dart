import 'package:flutter/material.dart';

import '../../models/life_cycle_handler.dart';
import '../base/object_capsule.dart';

class ValueNotifierCapsule<T> extends ObjectCapsule<ValueNotifier<T>> {
  /// Creates a new [ValueNotifierCapsule] with the given [value].
  /// 
  final VoidCallback? listener;
  
  const ValueNotifierCapsule({
    required super.value,
    this.listener,
  });

  @override
  LifecycleHandler get handler => LifecycleHandler(
    onInit: (){
      if(listener != null){
        value.addListener(listener!);
      }
    },
    onDispose: () {
      if(listener != null){
        value.removeListener(listener!);
      }
      value.dispose();
    },
  );
}