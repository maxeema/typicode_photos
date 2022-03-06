import 'package:flutter/material.dart';

import '../blocs/photos_list_bloc.dart';
import 'photos_list_item_widget.dart';
import 'photos_list_next_load_error_widget.dart';
import 'photos_list_progress_widget.dart';
import 'photos_list_reached_end_widget.dart';

// Use the same height for the widgets that appear as the latest widget in ListView.
// They are a continues progress, message with error and retry, and widget of having reached the end.
const _kPreferredLastWidgetHeight = 120.0;

// This widget works with bloc only when it has any data (not empty)
class PhotosListDataWidget extends StatelessWidget {
  PhotosListDataWidget({
    required this.bloc,
    Key? key,
  })  : assert(bloc.hasData),
        assert(bloc.data.value?.photos.asList().isNotEmpty == true),
        super(key: key);

  final PhotosListBloc bloc;

  Widget buildSeparator() => const Divider(height: 1);

  void _tryAutoloadNextOnReachingLast() {
    if (bloc.hasMore && !bloc.hasError && !bloc.state.inProgress) {
      bloc.loadNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    final photos = bloc.data.value!.photos;
    final hasMore = bloc.hasMore;
    final photosCount = photos.size;
    //
    return ListView.separated(
      itemCount: photosCount,
      itemBuilder: (context, index) {
        // print('>> build, $index, _autoLoadLocked: $_autoLoadLocked, hasMore: $hasMore, photosCount: ${photosCount}');
        if (index == photosCount - 1) {
          // On reaching and building the last item we try to automatically load more if possible
          _tryAutoloadNextOnReachingLast();
        }
        //
        final photo = photos[index];
        //
        final itemWidget = PhotoListItemWidget(
          key: ValueKey(photo),
          photo: photo,
          onPhotoClick: () {
            bloc.openPhoto(photo);
          },
        );
        //
        if (index < photosCount - 1) {
          // Show normally if it's not the last one
          return itemWidget;
        }
        // Now, it is the last one
        if (!hasMore) {
          // We reached the end
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              itemWidget,
              buildSeparator(),
              const PhotosListReachedEndWidget(
                preferredHeight: _kPreferredLastWidgetHeight,
              ),
            ],
          );
        }
        //
        if (bloc.state.inProgress) {
          // We are loading now
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              itemWidget,
              buildSeparator(),
              const PhotosListProgressWidget(
                preferredHeight: _kPreferredLastWidgetHeight,
              ),
            ],
          );
        }
        // We have an error
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            itemWidget,
            buildSeparator(),
            PhotosListNextLoadErrorWidget(
              preferredHeight: _kPreferredLastWidgetHeight,
              retry: () => bloc.loadNext(),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => buildSeparator(),
    );
  }
}
