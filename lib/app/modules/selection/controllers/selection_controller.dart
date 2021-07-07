import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:itmandiri/app/data/models/datamodel.dart';

class SelectionController extends GetxController {
  //TODO: Implement SelectionController
  DataModel json = Get.arguments;
  List<List<Datum>> parsedJson = [];
  final count = 0.obs;
  @override
  void onInit() {
    groupJson();
    super.onInit();
  }


  @override
  void onClose() {
    FilePicker.platform.clearTemporaryFiles();

  }
  void increment() => count.value++;

  groupJson() async {
    int currentAlpabet = 0;
    for (int i = 0; i < json.data.length; i++) {
      if (i == 0) {
        parsedJson.insert(currentAlpabet, [json.data[i]]);
      } else {
        String prevKode = json.data[i - 1].id.substring(0, 1);
        String currentKode = json.data[i].id.substring(0, 1);
        if (prevKode == currentKode){
        parsedJson[currentAlpabet].add(json.data[i]);
        }else{
          currentAlpabet++;
        parsedJson.insert(currentAlpabet, [json.data[i]]);

        }

      }
    }
    update(['table']);
  }
}
