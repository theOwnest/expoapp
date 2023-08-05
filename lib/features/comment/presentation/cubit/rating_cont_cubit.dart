import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_cont_state.dart';

class RatingContCubit extends Cubit<RatingContState> {
  RatingContCubit() : super(const RatingContState());
  rate({String? comment, double? rating}) {
    emit(
      RatingContState(
        comment: comment ?? super.state.comment,
        rating: rating ?? super.state.rating,
      ),
    );
  }
}
