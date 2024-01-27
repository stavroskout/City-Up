import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.amber,
      onImageCaptured: (value) {
        final path = value.path;
        print(":::::::::::::::::::::::::::::::::IMAGE_PATH: $path");
        if (path.contains('.jpeg')) {
          GallerySaver.saveImage(path, albumName: "Flutter");
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image.file(File(path)),
                );
              });
        }
      },
      onVideoRecorded: (value) {
        final path = value.path;
        GallerySaver.saveVideo(path, albumName: "Flutter");
        print(":::::::::::::::::::::::::::::::::VIDEO_PATH: $path");
      },
    );
    // return Container();
  }
}
