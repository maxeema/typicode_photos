import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:typicode_photos/data/connectivity/connectivity_watcher_mix.dart';
import 'package:typicode_photos/extensions/duration_x.dart';
import 'package:typicode_photos/presentation/generated/l10n.dart';

import '../blocs/photos_list_bloc.dart';
import 'photos_list_data_widget.dart';
import 'photos_list_first_load_error_widget.dart';
import 'photos_list_progress_widget.dart';

class PhotosListPage extends HookWidget with ConnectivityWatcherMix {
  PhotosListPage({required this.bloc, Key? key}) : super(key: key);

  final PhotosListBloc bloc;

  void _tryAutoloadOnNetworkChanged() {
    if (connectivity.hasNetwork && bloc.hasMore && bloc.hasError && !bloc.state.inProgress) {
      bloc.loadNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final subscription = connectivity.asStream.listen((_) {
        // Try to auto load data with a small delay after getting a new status
        //  because the network needs some time to be 'really' available
        Future.delayed(1000.ms, _tryAutoloadOnNetworkChanged);
      });
      return subscription.cancel;
    }, ['onetime']);
    //
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).appName),
      ),
      body: BlocBuilder<PhotosListBloc, PhotosListBlocState>(
        bloc: bloc,
        builder: (context, state) {
          // Here we go
          if (bloc.hasData) {
            return PhotosListDataWidget(
              bloc: bloc,
            );
          }
          // There is no data at this time
          if (state.inProgress) {
            return const PhotosListProgressWidget();
          } else {
            return PhotosListFirstLoadErrorWidget(
              retry: () => bloc.loadNext(),
            );
          }
        },
      ),
    );
  }
}
