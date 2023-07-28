import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleCubits {
  MultipleCubits({
    required this.cubits,
  });
  final Map<String, Cubit<Equatable>> cubits;
}
