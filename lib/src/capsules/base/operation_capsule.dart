import 'lifecycle_capsule.dart';

abstract class OperationCapsule<Source> extends LifeCycleCapsule{
  
  final Source source;
  
  const OperationCapsule({
    required this.source,
  });

}