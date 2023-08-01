import 'package:get/get.dart';

class CounterGetController extends GetxController {
  var counter = 0.obs;

  increment() => counter++;
}
