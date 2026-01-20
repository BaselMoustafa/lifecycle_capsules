
import 'package:flutter/material.dart';

import '../../models/life_cycle_handler.dart';
import '../base/object_capsule.dart';

/// A capsule that automatically disposes a [PageController] when the
/// associated [CapsulesState] is disposed.
///
/// This capsule wraps a [PageController] and ensures it is properly
/// disposed of when the widget is removed from the tree, preventing memory leaks.
///
/// Use [encapsulatePageController] in [CapsulesState] to create an instance.
class PageControllerCapsule extends ObjectCapsule<PageController> {
  /// Creates a new [PageControllerCapsule] with the given [value].
  /// 
  final VoidCallback? listener;
  const PageControllerCapsule({
    required super.value,
    this.listener,
  });

  @override
  LifecycleHandler get handler => LifecycleHandler(
    onInit: (){
      if(listener != null){
        value.addListener(listener!);
      }
    },
    onDispose: () {
      if(listener != null){
        value.removeListener(listener!);
      }
      value.dispose();
    },
  );
}

