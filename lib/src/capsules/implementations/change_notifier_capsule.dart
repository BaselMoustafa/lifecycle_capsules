import 'package:flutter/material.dart';

import '../../../lifecycle_capsules.dart';

class ChangeNotifierCapsule<T extends ChangeNotifier> extends ObjectCapsule<T> {
  
  final VoidCallback? listener;

  const ChangeNotifierCapsule({
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