import 'package:flutter/material.dart';
import 'package:lifecycle_capsules/lifecycle_capsules.dart';

class AnimationControllerCapsuleExample extends StatefulWidget {
  const AnimationControllerCapsuleExample({super.key});

  @override
  State<AnimationControllerCapsuleExample> createState() => _AnimationControllerCapsuleExampleState();
}

class _AnimationControllerCapsuleExampleState extends CapsulesState<AnimationControllerCapsuleExample> {

  late final animationController = encapsulateAnimationController(
    value: AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    ),
    lifecycleHandler: LifecycleHandler(
      onInit: (animationController) => animationController.repeat(reverse: true),
    ),
  );

  late final colorAnimation = ColorTween(
    begin: Colors.red,
    end: Colors.blue,
  ).animate(animationController);

  @override
  Set<dynamic> get encapsulatedObjects=> {
    animationController,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Controller Capsule Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return RotationTransition(
                        turns: animationController,
                        child: Container(
                          width: 20 + 200 * animationController.value,
                          height: 20 + 200 * animationController.value,
                          color: colorAnimation.value,
                        ),
                      );
                    },
                  ),
                ),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      animationController.repeat(reverse: true);
                    },
                    child: Text('Resume Animation'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      animationController.stop();
                    },
                    child: Text('Stop Animation'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

