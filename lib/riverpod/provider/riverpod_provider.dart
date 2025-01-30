import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodModel {
  const RiverpodModel({
    this.percentuale,
  });

  final int? percentuale;

  RiverpodModel copyWith({
    int? percentuale,
  }) {
    return RiverpodModel(
      percentuale: percentuale ?? this.percentuale,
    );
  }
}

// Definizione del provider
class RiverpodNotifier extends StateNotifier<RiverpodModel> {
  RiverpodNotifier() : super(RiverpodModel()) {
    debugPrint("RiverpodProvider initialize eseguito");
  }

  void updateModel({
    int? percentuale,
  }) async {
    state = state.copyWith(
      percentuale: percentuale,
    );
  }

  // Metodo per resettare tutti i campi ai valori di default
  void resetModel() {
    state = RiverpodModel(
      percentuale: null,
    );
  }

  @override
  void dispose() {
    resetModel();
    debugPrint("RiverpodProvider dispose eseguito");
    super.dispose();
  }
}

// Dichiarazione del provider
final riverpodProvider =
    StateNotifierProvider.autoDispose<RiverpodNotifier, RiverpodModel>((ref) {
  ref.onDispose(() {
    debugPrint("RiverpodProvider autoDispose eseguito");
  });
  return RiverpodNotifier();
});
