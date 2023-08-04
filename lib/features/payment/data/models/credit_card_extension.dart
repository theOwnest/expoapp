import 'package:flutter_credit_card/flutter_credit_card.dart';

extension CreditCardToMap on CreditCardModel {
  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cardHolderName': cardHolderName,
      'cvvCode': cvvCode,
      'isCvvFocused': isCvvFocused,
    };
  }
}

CreditCardModel creditCardFromMap(Map<String, dynamic> map) {
  return CreditCardModel(
    map['cardNumber'],
    map['expiryDate'],
    map['cardHolderName'],
    map['cvvCode'],
    map['isCvvFocused'],
  );
}
