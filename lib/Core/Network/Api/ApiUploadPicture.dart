import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../utils/shared_pref_utils.dart';
import 'package:http/http.dart' as http;
import '../../../utils/toast_utils.dart';

class ApiImageUpload {

  Future<String?> singleImageUpload(var context,File image)  async {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Image Uploading');
    try {
      String data = "";
      var access_token = await SharedPrefUtil.getString("access_token");
      var uri = Uri.parse("https://dev.htlbd.com/api/vendor/upload/store?token="+"$access_token");
      var request = http.MultipartRequest('POST',uri);
      if(image != null){
        String fileName = await image.path.split('/').last;
        request.files.add(http.MultipartFile('file',image.readAsBytes().asStream(),image.lengthSync(),filename: fileName));

        var response = await request.send();
        if(response.statusCode ==200){
          await response.stream.transform(utf8.decoder).listen((value) {
            data = value;
          });
        }
        pd.close();
        return data;
      }
    }catch(e){
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
        pd.close();
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
        pd.close();
      } else {
        ToastUtil.showShortToast(e.toString());
        pd.close();
      }
    }
  }
}