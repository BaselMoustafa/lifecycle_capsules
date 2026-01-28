![Alt text](https://raw.githubusercontent.com/BaselMoustafa/lifecycle_capsules/refs/heads/production/lifecycle_capsules_logo.jpg)

# Lifecycle Capsule

Prevents duplication of lifecycle management code for lifecycle-aware objects, such as `TextEditingController`, `AnimationController`, and similar resources.

```dart

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 500),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    animationController.dispose();
    super.dispose();
  }

```
### 🔥🔥🔥 Becomes
```dart 
  late final nameController = encapsulateTextEditingController();
  late final emailController = encapsulateTextEditingController();
  late final animationController = encapsulateAnimationController();
```

## Table of content
- [Usage](#usage)
- [Ready-made Capsules](#ready-made-capsules)
  - [TextEditingControllerCapsule](#texteditingcontrollercapsule)
  - [AnimationControllerCapsule](#animationcontrollercapsule)
  - [ListenerCapsule](#listenercapsule)
  - [PageControllerCapsule](#pagecontrollercapsule)
  - [ScrollControllerCapsule](#scrollcontrollercapsule)
  - [PeriodicOperationCapsule](#periodicoperationcapsule)
  - [DelayedOperationCapsule](#delayedoperationcapsule)
  - [ChangeNotifierCapsule](#changenotifiercapsule)
  - [ValueNotifierCapsule](#valuenotifiercapsule)


## Usage
In order to create these capsules, you must be inside a `StatefullWidget`, and all you need to do is transform the widget’s State from a regular Flutter `State` to a `CapsulesState`. Once you do that, you will have access to the functions that create the capsules, such as `encapsulateTextEditingController`, `encapsulateAnimationController`, `encapsulateListener`, and so forth


> ### **🚨 Important** 
> Don’t forget to include all the objects that have been encapsulated in the set that you are required to override in the CapsulesState, which is called encapsulatedObjects
```dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lifecycle_capsules/lifecycle_capsules.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends CapsulesState<RegisterScreen> {

  late final nameController = encapsulateTextEditingController(
    initialValue: "Basel Moustafa",
  );

  late final emailController = encapsulateTextEditingController();

  // Don't forget This
  @override
  Set<dynamic> get encapsulatedObjects=> {
    nameController,
    emailController,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Editing Controller Capsule Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 15,
          children: [
            TextField(
              controller: nameController,
            ),

            TextField(
              controller: emailController,
            ),

            ElevatedButton(
              onPressed: () {
                log("Name: ${nameController.value.text}");
                log("Email: ${emailController.value.text}");
              },
              child: Text('Get Values'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Ready-made Capsules
This section introduces the built-in (ready-made) capsules, explaining what each capsule does and how to use it .




### `TextEditingControllerCapsule`
Automatically disposes the given `TextEditingController` when the associated `CapsulesState` is disposed

In order to add a new `TextEditingController` and place it inside a `TextEditingControllerCapsule`, you need to call a function named `encapsulateTextEditingController` that is available within the `CapsulesState`.

```dart 
TextEditingController encapsulateTextEditingController({
  String? initialValue,
  VoidCallback? listener,
})
```




### `AnimationControllerCapsule`
Automatically disposes the given `AnimationController` when the associated `CapsulesState` is disposed

In order to add a new `AnimationController` and place it inside a `AnimationControllerCapsule`, you need to call a function named `encapsulateAnimationController` that is available within the `CapsulesState`.

```dart 
AnimationController encapsulateAnimationController({
  TickerProvider? vsync,
  Duration? duration,
  Duration? reverseDuration,
  double? lowerBound,
  double? upperBound,
  AnimationBehavior? animationBehavior,
  double? value,
  VoidCallback? listener,
})
```





### `ListenerCapsule`
Automatically adds the given listener to the given `Listenable` source in the `initState` 
and removes it in the `dispose`

In order to place the listener in `ListenerCapsule`, you need to call a function named `encapsulateListener` that is available within the `CapsulesState`.

> ### **📘 Note** 
> This capsule works with any source that inherits from Listenable, such as the `AnimationController` and `Animation`, or the `TextEditingController` and so forth.
```dart 
VoidCallback encapsulateListener<Source extends Listenable>({ 
  required Source source,
  required VoidCallback listener,
})
```


### `PageControllerCapsule`
Automatically disposes the given `PageController` when the associated `CapsulesState` is disposed.  
Optionally, it can also add and remove a listener to the controller.

In order to add a new `PageController` and place it inside a `PageControllerCapsule`, you need to call a function named `encapsulatePageController` that is available within the `CapsulesState`.

```dart
PageController encapsulatePageController({
  int? initialPage,
  bool keepPage = true,
  double viewportFraction = 1.0,
  void Function(ScrollPosition)? onAttach,
  void Function(ScrollPosition)? onDetach,
  VoidCallback? listener,
})
```


### `ScrollControllerCapsule`
Automatically disposes the given `ScrollController` when the associated `CapsulesState` is disposed.  
Optionally, it can also add and remove a listener to the controller.

In order to add a new `ScrollController` and place it inside a `ScrollControllerCapsule`, you need to call a function named `encapsulateScrollController` that is available within the `CapsulesState`.

```dart
ScrollController encapsulateScrollController({
  double initialScrollOffset = 0.0,
  bool keepScrollOffset = true,
  String? debugLabel,
  void Function(ScrollPosition)? onAttach,
  void Function(ScrollPosition)? onDetach,
  VoidCallback? listener,
})
```


### `PeriodicOperationCapsule`
Executes a periodic operation using a `Timer.periodic` and automatically cancels it when the associated `CapsulesState` is disposed.

In order to create a new periodic operation and place it inside a `PeriodicOperationCapsule`, you need to call a function named `encapsulatePeriodicOperation` that is available within the `CapsulesState`.

```dart
PeriodicOperationCapsule encapsulatePeriodicOperation({
  required Duration period,
  required void Function(Timer timer) operation,
})
```


### `DelayedOperationCapsule`
Executes a one-shot operation after a given delay using a `Timer`, and automatically cancels it when the associated `CapsulesState` is disposed.

In order to create a delayed operation and place it inside a `DelayedOperationCapsule`, you need to call a function named `encapsulateDelayedOperation` that is available within the `CapsulesState`.

```dart
DelayedOperationCapsule encapsulateDelayedOperation({
  required Duration delay,
  required void Function() operation,
})
```


### `ChangeNotifierCapsule`
Automatically disposes the given `ChangeNotifier` when the associated `CapsulesState` is disposed.  
Optionally, it can also add and remove a listener to the notifier.

In order to add a new `ChangeNotifier` and place it inside a `ChangeNotifierCapsule`, you need to call a function named `encapsulateChangeNotifier` that is available within the `CapsulesState`.

```dart
TChangeNotifier encapsulateChangeNotifier<TChangeNotifier extends ChangeNotifier>({
  required TChangeNotifier value,
  VoidCallback? listener,
})
```


### `ValueNotifierCapsule`
Automatically disposes the given `ValueNotifier` when the associated `CapsulesState` is disposed.  
Optionally, it can also add and remove a listener to the notifier.

In order to add a new `ValueNotifier` and place it inside a `ValueNotifierCapsule`, you need to call a function named `encapsulateValueNotifier` that is available within the `CapsulesState`.

```dart
ValueNotifier<T> encapsulateValueNotifier<T>({
  required T value,
  VoidCallback? listener,
})
```
