import 'package:flutter/material.dart';

import '../../../models/life_cycle_handler.dart';
import '../../base/resource_capsule.dart';

class AnimationControllerCapsule extends ResourceCapsule<AnimationController> {

  const AnimationControllerCapsule({
    required super.value, 
    super.lifeCycleHandler
  });

  @override
  LifeCycleHandler<AnimationController> get baseHandler {
    return LifeCycleHandler(
      onDispose: (controller)=> controller.dispose(),
    );
  }

}