import 'lifecycle_capsule.dart';

abstract class OperationCapsule<Source,Operation> extends LifeCycleCapsule<Operation,Source> {
  
  const OperationCapsule({
    required Source source,
    required super.value,
    required super.lifeCycleHandler,
  }):super(
    lifeCycleValue: source,
  );
}