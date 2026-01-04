import 'package:flutter/material.dart';
import 'package:lifecycle_capsules/lifecycle_capsules.dart';

class PageControllerCapsuleExample extends StatefulWidget {
  const PageControllerCapsuleExample({super.key});

  @override
  State<PageControllerCapsuleExample> createState() => _PageControllerCapsuleExampleState();
}

class _PageControllerCapsuleExampleState extends CapsulesState<PageControllerCapsuleExample> {
  late final pageController = encapsulatePageController(
    initialPage: 1
  );

  final List<Color> pageColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Set<dynamic> get encapsulatedObjects => {
    pageController,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Controller Capsule Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: pageColors.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: pageColors[index],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Page ${index + 1}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (pageController.page! > 0) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text('Previous'),
                ),
     
                ElevatedButton(
                  onPressed: () {
                    if (pageController.page! < pageColors.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

