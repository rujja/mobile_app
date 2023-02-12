part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(
      {required int counter, required String theme}) = _Initial;
}
