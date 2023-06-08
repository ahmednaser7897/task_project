part of 'logein_cubit.dart';

abstract class LogeinState extends Equatable {
  const LogeinState();

  @override
  List<Object> get props => [];
}

class AppInitial extends LogeinState {}

class LoadinLogeIn extends LogeinState {}

class ScLogeIn extends LogeinState {}

class ErorrLogeIn extends LogeinState {
  final ServerExtension failur;
  const ErorrLogeIn(this.failur);
}
