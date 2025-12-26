import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lifecycle_capsules/lifecycle_capsules.dart';

class AddListenerCapsuleExample extends StatefulWidget {
  const AddListenerCapsuleExample({super.key});

  @override
  State<AddListenerCapsuleExample> createState() => _AddListenerCapsuleExampleState();
}

class _AddListenerCapsuleExampleState extends CapsulesState<AddListenerCapsuleExample> {

  late final emailController = encapsulateTextEditingController(
    value: TextEditingController(),
  );

  late final passwordController = encapsulateTextEditingController(
    value: TextEditingController(),
  );

  @override
  Set<dynamic> get encapsulatedObjects=> {
    emailController,
    passwordController,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Listener Capsule Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email"),
            TextField(
              controller: emailController,
            ),

            Text("Password"),
            TextField(
              controller: passwordController,
            ),
            const SizedBox(height: 16),
            _LoginButton(
              emailController: emailController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatefulWidget {
  const _LoginButton({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<_LoginButton> createState() => __LoginButtonState();
}

class __LoginButtonState extends CapsulesState<_LoginButton> {

  bool isValidEmail = false;
  bool isValidPassword = false;

  late final emailListener = encapsulateListener(
    source: widget.emailController,
    operation: (controller){
      isValidEmail = widget.emailController.value.text.isNotEmpty;
      _onUserInputsChanged();
    },
  );

  late final passwordListener = encapsulateListener(
    source: widget.passwordController,
    operation: (controller){
      isValidPassword = widget.passwordController.value.text.isNotEmpty;
      _onUserInputsChanged();
    },
  );

  late final AnimationController animationController = encapsulateAnimationController(
    value: AnimationController(
      vsync: this,
      duration: const Duration(milliseconds:500),
    ),
  );

  late final colorAnimation = ColorTween(
    begin: Colors.grey.shade500,
    end: Colors.blueAccent,
  ).animate(
    CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
  );

  @override
  Set<dynamic> get encapsulatedObjects=> {
    emailListener,
    passwordListener,
    animationController,
  };

  void _onUserInputsChanged(){
    if(isValidEmail && isValidPassword){
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            log("Login with email: ${widget.emailController.value.text} and password: ${widget.passwordController.value.text}");
          },
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double get buttonHeight => 50 + 10 * animationController.value;

  double get buttonWidth => double.infinity - 20 * (1 -animationController.value);

  Color? get buttonColor => colorAnimation.value;

}

