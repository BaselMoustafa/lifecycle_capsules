import 'package:flutter/widgets.dart';
import '../../../../lifecycle_capsules.dart';

class ListenerCapsule<Source extends Listenable> extends ObjectCapsule<VoidCallback> {
  
  final Source source;

  const ListenerCapsule({
    required this.source,
    required super.value, 
  });
  
  @override
  LifecycleHandler get handler =>LifecycleHandler(
    onInit: ()=> source.addListener(
      value,
    ),
    onDispose: ()=> source.removeListener(
      value,
    ),
  );
  
}