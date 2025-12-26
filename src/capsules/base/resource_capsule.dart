import 'lifecycle_capsule.dart';

abstract class ResourceCapsule<Value> extends LifeCycleCapsule<Value,Value> {

  const ResourceCapsule({
    required super.value,
    required super.lifeCycleHandler,
  }):super(
    lifeCycleValue: value,
  );
}