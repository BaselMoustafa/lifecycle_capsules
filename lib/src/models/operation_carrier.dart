class OperationCarrier<Source>{
  
  final void Function(Source source) operation;

  const OperationCarrier({
    required this.operation,
  });
}