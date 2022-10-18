import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PageLoading extends StatefulWidget {
  const PageLoading({Key? key}) : super(key: key);

  @override
  State<PageLoading> createState() => _PageLoadingState();
}

class _PageLoadingState extends State<PageLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.grey,
          size: 50.0,
        ),
        ),
      );
  }
}
