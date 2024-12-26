part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityState {}

class ConnectivityUnknown extends ConnectivityState {}

class ConnectivityNone extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {}
