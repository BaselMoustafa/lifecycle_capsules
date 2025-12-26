import 'package:flutter/material.dart';
import '../capsules/base/lifecycle_capsule.dart';

abstract class CapsulesState<W extends StatefulWidget> extends State<W> with TickerProviderStateMixin {

  final Set<LifeCycleCapsule> _capsules = {};

  Set<dynamic> get encapsulatedObjects;

  @override
  void initState() {
    super.initState();
    for (var object in encapsulatedObjects) {
      object;
    }
    for (var capsule in _capsules) {
      capsule.onInit();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var attribute in _capsules) {
      attribute.onDidChangeDependencies();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    for (var attribute in _capsules) {
      attribute.onDeactivate();
    }
  }

  @override
  void dispose() {
    for (var attribute in _capsules) {
      attribute.onDispose.call();
    }
    super.dispose();
  }

  Value addCapsule<Value ,LifecycleValue>({
    required LifeCycleCapsule<Value,LifecycleValue> capsule
  }) {
    _capsules.add(capsule);
    return capsule.value;
  }
  
}
