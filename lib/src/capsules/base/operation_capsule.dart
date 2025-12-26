import '../../models/operation_carrier.dart';
import 'lifecycle_capsule.dart';

abstract class OperationCapsule<Source> extends LifeCycleCapsule<OperationCarrier<Source>,Source> {
  
  final Source source;
  
  const OperationCapsule({
    required this.source,
    required super.value,
    required super.lifecycleHandler,
  }):super(
    lifecycleValue: source,
  );

}