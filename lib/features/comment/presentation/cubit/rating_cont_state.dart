// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'rating_cont_cubit.dart';

class RatingContState extends Equatable {
  const RatingContState({
    this.rating,
    this.comment,
  });
  final double? rating;
  final String? comment;
  @override
  List<dynamic> get props => [
        rating,
        comment,
      ];
}
