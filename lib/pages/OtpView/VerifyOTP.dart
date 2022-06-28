import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Helpers/APIHelpers.dart';
import '../../Utils/colors.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  final _verifyOtpFormKey = GlobalKey<FormState>();
  TextEditingController verifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _verifyOtpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verify OTP",textAlign: TextAlign.left, style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500,color:AppColor.primary),),
                TextFormField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: verifyController,
                  validator: (val){
                    if(int.parse(val!) != APIHelper.apiHelper.otp || val.isEmpty){
                      return "Please Enter Valid OTP";
                    }
                    return null;
                  },
                  onSaved: (val){

                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your OTP",
                    label: Text("OTP"),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    if(_verifyOtpFormKey.currentState!.validate()){
                      Get.offNamedUntil("/", (route) => false);
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
      ),
    );
  }
}
