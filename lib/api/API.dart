// ignore_for_file: file_names

import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API {
  
  final String _URL;

  API(this._URL,);

  call()async{
    var response = await http.get(Uri.parse(_URL));
    var body = null;

    if (response.statusCode == 200){
      body = convert.jsonDecode(response.body);
    }else {
      log('Impossible to consume API ERROR_CODE:${response.statusCode.toString()}');
    }
    return body;
  }  
}
