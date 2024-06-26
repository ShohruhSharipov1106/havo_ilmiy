part of 'connectivity_bloc.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({
    @Default(true) bool connected,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _ConnectivityState;
}
