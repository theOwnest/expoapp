import 'package:expo_kg/features/product/data/models/comment.dart';
import 'package:expo_kg/shared/configs/random.dart';

final commentsList = List.generate(
  10,
  (index) => CommentModel(
    author: 'Anna',
    rating: random.nextDouble() * 5,
    comment:
        'НLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam.',
    time: DateTime.now().subtract(
      Duration(
        days: random.nextInt(20),
      ),
    ),
  ),
);
