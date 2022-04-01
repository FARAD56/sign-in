import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UploadScreen extends StatefulWidget {
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.green,
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onDrop: acceptFile,
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 80,
                color: Colors.white,
              ),
              Text(
                'Drop Files here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name: $name');
    print('Name: $mime');
    print('Name: $bytes');
    print('Name: $url');
  }
}
