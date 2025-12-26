import 'package:flutter/cupertino.dart';

import '../capsules/implementations/operations_capsules/add_listener_capsule.dart';
import '../capsules/implementations/resources_capsules/animation_controller_capsule.dart';
import '../capsules/implementations/resources_capsules/text_editing_controller_capsule.dart';
import '../models/life_cycle_handler.dart';
import '../models/operation_carrier.dart';
import 'capsules_state.dart';

extension AddingCapsulesExtension on CapsulesState {

  TextEditingController encapsulateTextEditingController({
    required TextEditingController value,
    LifecycleHandler<TextEditingController>? lifecycleHandler,
  })=>addCapsule(
    capsule: TextEditingControllerCapsule(
      value: value,
      lifecycleHandler: lifecycleHandler,
    )
  );

  AnimationController encapsulateAnimationController({
    required AnimationController value,
    LifecycleHandler<AnimationController>? lifecycleHandler,
  })=>addCapsule(
    capsule: AnimationControllerCapsule(
      value: value,
      lifecycleHandler: lifecycleHandler,
    )
  );

  OperationCarrier encapsulateListener<Source extends Listenable>({
    required Source source,
    required void Function(Source source) operation,
    LifecycleHandler<Source>? lifecycleHandler,
  })=>addCapsule(
    capsule:  AddListenerCapsule<Source>(
      source: source,
      value: OperationCarrier<Source>(operation: operation),
      lifecycleHandler: lifecycleHandler,
    )
  );
}