import 'package:flutter/widgets.dart';

import '../../../models/life_cycle_handler.dart';
import '../../base/operation_capsule.dart';

class AddListenerCapsule<Source extends Listenable> extends OperationCapsule<Source,VoidCallback> {
  
  const AddListenerCapsule({
    required super.source, 
    required super.value,
    super.lifeCycleHandler,
  });
  
  @override
  LifeCycleHandler<Source> get baseHandler {
    return LifeCycleHandler(
      onInit: (source)=> source.addListener(value),
      onDispose: (source)=> source.removeListener(value),
    );
  }
}