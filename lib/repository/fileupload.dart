import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class fileuploud extends ChangeNotifier{
 PlatformFile? file;
 File? displayfile;
  Future imagechose() async {
    FilePickerResult? f = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false
    );
    if (f != null) {
      file = f.files.first;
      displayfile = File(file!.toString());
      print(file!.bytes);
    } else {
      
    }
  }
  
}
