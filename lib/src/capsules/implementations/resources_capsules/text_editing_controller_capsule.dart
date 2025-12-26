
import 'package:flutter/material.dart';
import '../../../models/life_cycle_handler.dart';
import '../../base/resource_capsule.dart';

class TextEditingControllerCapsule extends ResourceCapsule<TextEditingController> {
  
  const TextEditingControllerCapsule({
    required super.value, 
    super.lifeCycleHandler
  });

  @override
  LifeCycleHandler<TextEditingController> get baseHandler{
    return LifeCycleHandler(
      onDispose: (controller)=>controller.dispose(),
    );
  }
}