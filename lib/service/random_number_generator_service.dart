import 'dart:math';

class RandomNumberGeneratorService {
  static int generateRandomNumber(int maxNumber) {
    Random ramdomNumber = Random();
    return ramdomNumber.nextInt(maxNumber);
  }
}
