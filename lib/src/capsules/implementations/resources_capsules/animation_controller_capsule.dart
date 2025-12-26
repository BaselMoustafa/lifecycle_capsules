import 'package:flutter/material.dart';

import '../../../models/life_cycle_handler.dart';
import '../../base/resource_capsule.dart';

class AnimationControllerCapsule extends ResourceCapsule<AnimationController> {

  const AnimationControllerCapsule({
    required super.value, 
    super.lifecycleHandler
  });

  @override
  LifecycleHandler<AnimationController> get baseHandler {
    return LifecycleHandler(
      onDispose: (controller)=> controller.dispose(),
    );
  }

}