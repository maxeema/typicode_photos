import 'package:flutter/material.dart';
import 'package:typicode_photos/presentation/generated/assets.gen.dart';
import 'package:typicode_photos/presentation/generated/l10n.dart';
import 'package:websafe_svg/websafe_svg.dart';

const _kFailedImageHeight = 100.0;

class PhotosListFirstLoadErrorWidget extends StatelessWidget {
  const PhotosListFirstLoadErrorWidget({
    required this.retry,
    Key? key,
  }) : super(key: key);

  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: _kFailedImageHeight,
            child: WebsafeSvg.asset(Assets.offline, height: _kFailedImageHeight),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).loadPhotosFirstPageFailedMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              child: Text(
                S.of(context).retryButton,
              ),
              onPressed: retry,
            ),
          )
        ],
      ),
    );
  }
}
