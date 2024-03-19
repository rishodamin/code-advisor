import 'package:flutter/material.dart';

class ResponseBox extends StatelessWidget {
  final String data;
  const ResponseBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      //   width: width * 0.18,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.05),
          borderRadius: BorderRadius.circular(40)),
      child: Text(
        data,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
