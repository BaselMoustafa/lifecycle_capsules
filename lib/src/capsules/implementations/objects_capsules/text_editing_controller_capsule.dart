
import 'package:flutter/material.dart';
import '../../../models/life_cycle_handler.dart';
import '../../base/object_capsule.dart';

class TextEditingControllerCapsule extends ObjectCapsule<TextEditingController> {
  
  const TextEditingControllerCapsule({
    required super.value, 
  });

  @override
  LifecycleHandler get handler{
    return LifecycleHandler(
      onDispose: ()=> value.dispose(),
    );
  }
}