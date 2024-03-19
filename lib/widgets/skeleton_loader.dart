import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletalLoader extends StatelessWidget {
  const SkeletalLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Skeletonizer(
      ignoreContainers: true,
      enabled: true,
      child: Container(
        // height: 20,
        //  width: width * 0.18,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),

        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              child: Text(
                'a' * ((width / 1920) * 100).toInt(),
                style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
