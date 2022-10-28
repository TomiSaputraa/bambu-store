import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearProgres extends StatelessWidget {
  const LinearProgres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            LinearProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Memuat data produk...",
              style: TextStyle(),
              maxLines: 1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
