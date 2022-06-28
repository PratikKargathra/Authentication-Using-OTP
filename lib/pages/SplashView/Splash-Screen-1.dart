import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memewala/Utils/colors.dart';
import '../../Data/List.dart';
import '../../controllers/SplashSliderController.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  SplashSliderController splashSliderController =
      Get.put(SplashSliderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
              items: splashImage
                  .map((e) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height * 0.467,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOutCirc,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Mekes Memes Easily",
            style: TextStyle(
                color: AppColor.primary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          Text(
            "Phasellus fringilla purus metus, vitae pellentesque neque venenatis at, Curabitur suscipit, metus sed.",
            style: TextStyle(
                color: AppColor.primary,
                fontSize: 18,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("otp-view");
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fixedSize: const Size(345, 50),
              primary: AppColor.primary,
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
