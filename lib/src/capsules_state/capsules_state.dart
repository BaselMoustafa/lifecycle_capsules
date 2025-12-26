import 'package:flutter/material.dart';
import '../../lifecycle_capsules.dart';


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
      capsule.handler.onInit?.call();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var attribute in _capsules) {
      attribute.handler.onDidChangeDependencies?.call();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    for (var attribute in _capsules) {
      attribute.handler.onDeactivate?.call();
    }
  }

  @override
  void dispose() {
    for (var attribute in _capsules) {
      attribute.handler.onDispose?.call();
    }
    super.dispose();
  }

  Value addCapsule<CapsuleType extends LifeCycleCapsule,Value>({
    required CapsuleType capsule,
    required Value Function(CapsuleType capsule) valueFactory
  }) {
    _capsules.add(capsule);
    return valueFactory(capsule);
  }

  Value addObjectCapsule<Value>({
    required ObjectCapsule<Value> capsule,
  })=>addCapsule(
    capsule: capsule,
    valueFactory: (capsule) => capsule.value,
  );

  OperationCapsule<Value> addOperationCapsule<Value>({
    required OperationCapsule<Value> operation,
  })=>addCapsule<OperationCapsule<Value>,OperationCapsule<Value>>(
    capsule: operation,
    valueFactory: (capsule) => capsule,
  );
  
}
