part of 'single_bloc.dart';

class SingleBlocState<E, D> extends Equatable {
  SingleBlocState([
    SingleBlocStatus initialStatus = SingleBlocStatus.idle,
    D? initialData,
    SingleBlocErrorInfo<E>? initialError,
  ]) {
    status.._subject.value = initialStatus;
    if (initialData != null) data.._subject.value = initialData;
    if (initialError != null) error.._subject.value = initialError;
  }

  late final status = SingleBlocStateItem<SingleBlocStatus>();
  late final data = SingleBlocStateItem<D>(); //
  late final error = SingleBlocStateItem<SingleBlocErrorInfo<E>?>(); //

  @override
  List<Object?> get props => [status.value, data.value, error.value];

  SingleBlocState<E, D> copyWith({
    SingleBlocStatus Function()? newStatus,
    D Function()? newData,
    SingleBlocErrorInfo<E> Function()? newError,
  }) {
    return SingleBlocState(
      newStatus?.call() ?? this.status.value!,
      newData == null ? this.data.value : newData.call(),
      newError == null ? this.error.value : newError.call(),
    );
  }
}
