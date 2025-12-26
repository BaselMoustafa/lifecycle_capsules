import 'package:flutter/material.dart';

import '../../../models/life_cycle_handler.dart';
import '../../base/object_capsule.dart';

class AnimationControllerCapsule extends ObjectCapsule<AnimationController> {

  const AnimationControllerCapsule({
    required super.value, 
  });

  @override
  LifecycleHandler get handler {
    return LifecycleHandler(
      onDispose: ()=> value.dispose(),
    );
  }

}