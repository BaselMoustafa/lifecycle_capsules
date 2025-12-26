import 'lifecycle_capsule.dart';

abstract class ObjectCapsule<Value> extends LifeCycleCapsule{

  final Value value;

  const ObjectCapsule({
    required this.value,
  });
  
}