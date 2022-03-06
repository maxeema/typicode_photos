part of 'single_bloc.dart';

class SingleBlocErrorInfo<S> extends Equatable {
  const SingleBlocErrorInfo({required this.error, required this.source, this.stackTrace});

  // Bloc's specific error (it could be a detailed failure of an interaction with a back-end server)
  // Then in UI we can detect ad type of error and show a properly localized message
  final S? error;

  // It is an original error and could be the same as 'error' but also could be as just any Dart error/exception
  final Object source;

  // StackTrace information
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [error, source, stackTrace];

  @override
  bool? get stringify => true;
}
