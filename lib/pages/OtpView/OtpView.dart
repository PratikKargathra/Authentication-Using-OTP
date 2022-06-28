import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:memewala/Helpers/APIHelpers.dart';

import '../../Utils/colors.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {

  final _otpFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  String phoneLocal = "";
  String countryCodeLocal = "";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _otpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Welcome",textAlign: TextAlign.left, style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500,color:AppColor.primary),),
              TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                controller: countryCodeController,
                validator: (val){
                  if(int.parse(val!) != 91 || val.isEmpty){
                    return "Please Enter Indian Country Code";
                  }
                  return null;
                },
                onSaved: (val){
                  countryCodeLocal = val!;
                },
                decoration: const InputDecoration(

                  hintText: "Enter Country Code",
                  label: Text("Country Code"),
                ),
              ),
              TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: phoneController,
                validator: (val){
                  if(val!.length!=10 || val.isEmpty){
                    return "Please Enter Valid Phone Number.";
                  }
                  return null;
                },
                onSaved: (val){
                  phoneLocal = val!;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your phone number",
                  label: Text("Phone Number"),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  if(_otpFormKey.currentState!.validate()){
                    _otpFormKey.currentState!.save();
                    String res = await APIHelper.apiHelper.otpSend(phoneNo: phoneLocal, countryCode: countryCodeLocal);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
                    Get.toNamed('otp-verify');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width,50),
                  primary: AppColor.primary,
                ),
                child: const Text("Generate Otp",style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
