// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:itmandiri/app/data/models/datamodel.dart';
import 'package:collection/collection.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  DataModel? json;
  bool isError = false;
  String? errorMessage;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

Future getFile()async{
  isError = false;
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['json'],
  );
  if(result!=null){
    PlatformFile file = result.files.single;
    File temp = File(file.path!);
    try{
    DataModel parsedData = dataModelFromJson(temp.readAsStringSync());
    json = parsedData;
    await sortData();
    return true;
    }catch(e){
     isError = true;
     // print(isError);
     errorMessage = "File yang anda masukkan tidak sesuai kriteria";
     FilePicker.platform.clearTemporaryFiles();
    }
  }
  return false;
}

sortData()async{
  json!.data.sort((a,b)=> a.id.compareTo(b.id));
  json!.data.groupListsBy((element) => element.id.substring(0,1));
}


}
