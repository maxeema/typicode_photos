part of 'single_bloc.dart';

extension SingleBlocX<E, D, A> on SingleBloc<E, D, A> {
  SingleBlocStateItem<SingleBlocStatus> get status => state.status; //
  SingleBlocStateItem<D> get data => state.data; //
  SingleBlocStateItem<SingleBlocErrorInfo<E>?> get error => state.error; //

  bool get hasData => state.data.hasValue; //
  bool get hasError => state.error.hasValue;

  void resetError() {
    state.error._value = null;
  }
}
