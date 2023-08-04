import 'package:expo_kg/features/payment/data/models/credit_card_extension.dart';
import 'package:expo_kg/shared/constants/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardController extends Cubit<List<CreditCardModel>> {
  CardController() : super([]);
  static final creditBox = Hive.box(
    HiveConstants.creditBox,
  );
  load() {
    List<CreditCardModel> cards = [];
    for (final card in creditBox.values) {
      cards.add(
        creditCardFromMap(
          Map<String, dynamic>.from(card),
        ),
      );
    }
    emit(cards);
  }

  addCard(CreditCardModel card) {
    creditBox.add(
      card.toMap(),
    );
    emit(
      [
        ...super.state,
        card,
      ],
    );
  }
}
