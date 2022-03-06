import 'presentation/actions/actions_delegate.dart';
import 'state/app_state_manager.dart';

class AppActionsDelegate extends ActionsDelegate {
  AppActionsDelegate(this._appStateManager) {
    _init();
  }

  final AppStateManager _appStateManager;

  void _init() {
    photoOpen.listen((photo) {
      _appStateManager.setLastPhoto(photo.id);
    });
    // photoOpen.pipe(appState.lastPhoto);
  }
}
