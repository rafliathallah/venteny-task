part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityEvent {}

class ConnectivityChanged implements ConnectivityEvent {
  final ConnectivityResult connectivity;
  ConnectivityChanged(this.connectivity);
}
