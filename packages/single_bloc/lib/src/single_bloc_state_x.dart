part of 'single_bloc.dart';

extension SingleBlocStateX<E, D> on SingleBlocState<E, D> {
  bool get isIdle => status.value == SingleBlocStatus.idle; //
  bool get inProgress => status.value == SingleBlocStatus.inProgress; //
  bool get completed => status.value == SingleBlocStatus.completed;
}
