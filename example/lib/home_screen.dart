import 'package:flutter/material.dart';
import 'capsules_examples/listener_capsule_example.dart';
import 'capsules_examples/animation_controller_capsule_example.dart';
import 'capsules_examples/text_editing_controller_capsule_example.dart';
import 'core/to_capsule_example_screen_button.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            
            ToCapsuleExampleScreenButton(
              screen: TextEditingControllerCapsuleExample(),
            ),

            ToCapsuleExampleScreenButton(
              screen: AnimationControllerCapsuleExample(),
            ),

            ToCapsuleExampleScreenButton(
              screen: ListenerCapsuleExample(),
            ),
          ],
        ),
      ),
    );
  }
}


