import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typicode_photos/data/photo.repository.web/bad_response.dart';

part 'failure_details.freezed.dart';

@freezed
class FailureDetails with _$FailureDetails {
  const factory FailureDetails.badResponse(BadResponse details) = _BadResponse;

  const factory FailureDetails.timeoutError(Object error, StackTrace stackTrace) = _TimeoutError;

  const factory FailureDetails.networkProblem(Object error, StackTrace stackTrace) = _NetworkProblem;
}
