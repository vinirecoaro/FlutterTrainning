import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({Key? key}) : super(key: key);

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1,
          height: 60,
        ),
        Image.asset(
          AppImages.user2,
          height: 60,
        ),
        Image.asset(
          AppImages.user3,
          height: 60,
        ),
        Image.asset(
          AppImages.view1,
          height: 101,
        ),
        Image.asset(
          AppImages.view2,
          height: 100,
        ),
        Image.asset(
          AppImages.view3,
          height: 100,
        ),
      ],
    );
  }
}
