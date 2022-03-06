import 'package:flutter/material.dart';
import 'package:typicode_photos/presentation/generated/l10n.dart';

class PhotosListNextLoadErrorWidget extends StatelessWidget {
  const PhotosListNextLoadErrorWidget({
    required this.retry,
    this.preferredHeight,
    Key? key,
  }) : super(key: key);

  final VoidCallback retry;
  final double? preferredHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: preferredHeight ?? double.infinity),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).loadPhotosNextPageFailedMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(width: 16),
            Center(
              child: OutlinedButton(
                child: Text(
                  S.of(context).retryButton,
                ),
                onPressed: retry,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
