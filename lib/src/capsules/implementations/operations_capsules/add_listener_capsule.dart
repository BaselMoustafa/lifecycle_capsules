import 'package:flutter/widgets.dart';

import '../../../models/life_cycle_handler.dart';
import '../../base/operation_capsule.dart';

class AddListenerCapsule<Source extends Listenable> extends OperationCapsule<Source> {
  
  const AddListenerCapsule({
    required super.source, 
    required super.value,
    super.lifecycleHandler,
  });
  
  @override
  LifecycleHandler<Source> get baseHandler {
    return LifecycleHandler(
      onInit: (source)=> source.addListener(
        _listener
      ),
      onDispose: (source)=> source.removeListener(
        _listener,
      ),
    );
  }

  void  _listener() => value.operation.call(source);

}