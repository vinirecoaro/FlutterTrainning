import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
        1,
        "Meu card",
        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
        "Percebemos, cada vez mais, que a necessidade de renovação processual faz parte de um processo de gerenciamento do fluxo de informações.");
  }
}
