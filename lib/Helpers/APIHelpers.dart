import 'dart:math';
import 'package:http/http.dart' as http;

class APIHelper{
  APIHelper._();
  static final APIHelper apiHelper =  APIHelper._();
  int otp = 0;
  String companyName = "dobs Infosys";
  String time = "5 min";
  String authKey = "9b3b647fdbe38f74";
  String sid = "5004";
  Future<String> otpSend({required String phoneNo, required String countryCode,}) async {
    otp = Random().nextInt(8999)+1000;
    String API = "https://api.authkey.io/request?authkey=$authKey&mobile=$phoneNo&country_code=$countryCode&sid=$sid&company=$companyName&otp=$otp&time=$time";
    Uri api =  Uri.parse(API);
    http.Response response = await http.get(api);
    if(response.statusCode == 200){
      return "Otp sented successfully";
    } else {
      return "Try Again";
    }
  }

}


