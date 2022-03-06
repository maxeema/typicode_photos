import 'package:flutter/material.dart';
import 'package:typicode_photos/presentation/generated/l10n.dart';

class PhotosListReachedEndWidget extends StatelessWidget {
  const PhotosListReachedEndWidget({
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Text(S.of(context).reachedEnd)),
      ),
    );
  }
}
