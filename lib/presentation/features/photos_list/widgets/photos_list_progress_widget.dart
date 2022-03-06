import 'package:flutter/material.dart';

class PhotosListProgressWidget extends StatelessWidget {
  const PhotosListProgressWidget({
    this.preferredHeight,
    Key? key,
  }) : super(key: key);

  final double? preferredHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: preferredHeight ?? double.infinity,
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
