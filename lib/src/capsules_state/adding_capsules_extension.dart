import 'package:flutter/cupertino.dart';
import '../capsules/implementations/objects_capsules/animation_controller_capsule.dart';
import '../capsules/implementations/objects_capsules/listener_capsule.dart';
import '../capsules/implementations/objects_capsules/text_editing_controller_capsule.dart';
import 'capsules_state.dart';

extension AddingCapsulesExtension on CapsulesState {

  TextEditingController encapsulateTextEditingController({
    String? initialValue,
  })=>addObjectCapsule(
    capsule: TextEditingControllerCapsule(
      value: TextEditingController(
        text: initialValue,
      ),
    )
  );

  AnimationController encapsulateAnimationController({
    TickerProvider? vsync,
    Duration? duration,
    Duration? reverseDuration,
    double? lowerBound,
    double? upperBound,
    AnimationBehavior? animationBehavior,
    double? value,
  })=>addObjectCapsule(
    capsule: AnimationControllerCapsule(
      value: AnimationController(
        value: value,
        vsync: vsync?? this,
        duration: duration?? const Duration(milliseconds: 500),
        reverseDuration: reverseDuration,
        lowerBound: lowerBound?? 0,
        upperBound: upperBound?? 1,
        animationBehavior: animationBehavior?? AnimationBehavior.normal,
      ),
    )
  );

  VoidCallback encapsulateListener<Source extends Listenable>({
    required Source source,
    required VoidCallback listener,
  })=>addObjectCapsule(
    capsule:  ListenerCapsule<Source>(
      source: source,
      value: listener,
    )
  );
}