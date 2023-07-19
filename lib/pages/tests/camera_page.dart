import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Camera Page"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Wrap(
                        children: [
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.camera),
                            title: const Text("Camera"),
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              photo = await picker.pickImage(
                                  source: ImageSource.camera);
                              if (photo != null) {
                                String path = (await path_provider
                                        .getApplicationDocumentsDirectory())
                                    .path;
                                String name = basename(photo!.path);
                                await photo!.saveTo("$path/$name");
                                await GallerySaver.saveImage(photo!.path);
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
                          ),
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.images),
                            title: const Text("Galeria"),
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              photo = await picker.pickImage(
                                  source: ImageSource.gallery);
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Text("Camera")),
          photo != null
              ? Container(
                  child: Image.file(File(photo!.path)),
                )
              : Container()
        ],
      ),
    ));
  }
}
