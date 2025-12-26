import 'package:flutter/cupertino.dart';

import '../capsules/implementations/operations_capsules/add_listener_capsule.dart';
import '../capsules/implementations/resources_capsules/animation_controller_capsule.dart';
import '../capsules/implementations/resources_capsules/text_editing_controller_capsule.dart';
import '../models/life_cycle_handler.dart';
import 'capsules_state.dart';

extension AddingCapsulesExtension on CapsulesState {

  TextEditingController encapsulateTextEditingController({
    required TextEditingController value,
    LifeCycleHandler<TextEditingController>? lifeCycleHandler,
  })=>addCapsule(
    capsule: TextEditingControllerCapsule(
      value: value,
      lifeCycleHandler: lifeCycleHandler,
    )
  );

  AnimationController encapsulateAnimationController({
    required AnimationController value,
    LifeCycleHandler<AnimationController>? lifeCycleHandler,
  })=>addCapsule(
    capsule: AnimationControllerCapsule(
      value: value,
      lifeCycleHandler: lifeCycleHandler,
    )
  );

  VoidCallback encapsulateListener<Source extends Listenable>({
    required Source source,
    required VoidCallback value,
    LifeCycleHandler<Source>? lifeCycleHandler,
  })=>addCapsule(
    capsule:  AddListenerCapsule<Source>(
      source: source,
      value: value,
      lifeCycleHandler: lifeCycleHandler,
    )
  );
}