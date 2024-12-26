import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

@injectable
//Menambhakn anotattion injecttable untuk di generate, penggunaan ini di tunjukan untuk mendekalariskan pemangilan class dalam diContainer, lihat Main.dart
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  ConnectivityBloc() : super(ConnectivityUnknown()) {
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> resultList) async {
      final ConnectivityResult result = resultList.first;
      add(ConnectivityChanged(result));
    });

    on<ConnectivityChanged>(_onConnectivityChanged);
  }
  void _onConnectivityChanged(
      ConnectivityChanged event, Emitter<ConnectivityState> emit) async {
    final connectivity = event.connectivity;
    if (connectivity == ConnectivityResult.none) {
      emit(ConnectivityNone());
    } else if (connectivity == ConnectivityResult.wifi ||
        connectivity == ConnectivityResult.mobile) {
      emit(ConnectivityConnected());
    } else {
      emit(ConnectivityNone());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
