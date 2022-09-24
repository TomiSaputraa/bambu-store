import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearProgres extends StatelessWidget {
  const LinearProgres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100,
        child: LinearProgressIndicator(
          color: Colors.black,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
