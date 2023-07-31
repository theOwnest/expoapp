import 'package:expo_kg/features/profile/data/models/order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderController extends Cubit<OrderModel> {
  OrderController(OrderModel order) : super(order);
}
