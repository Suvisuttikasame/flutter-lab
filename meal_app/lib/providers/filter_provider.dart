import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterSet {
  something0,
  something1,
  something2,
  something3,
}

class FilterNotifier extends StateNotifier<Map<FilterSet, bool>> {
  FilterNotifier()
      : super({
          FilterSet.something0: false,
          FilterSet.something1: false,
          FilterSet.something2: false,
          FilterSet.something3: false,
        });

  void setFilter(FilterSet key, bool value) {
    state = {...state, key: value};
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<FilterSet, bool>>((ref) {
  return FilterNotifier();
});
