import 'package:expo_kg/features/product/data/enums/list_grid_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListGridType extends Cubit<ListGridEnum> {
  ListGridType()
      : super(
          ListGridEnum.grid,
        );
  change() {
    if (super.state == ListGridEnum.grid) {
      emit(ListGridEnum.list);
    } else {
      emit(ListGridEnum.grid);
    }
  }
}
