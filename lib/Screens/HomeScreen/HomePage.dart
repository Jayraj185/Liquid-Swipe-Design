import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe_design/Controllers/HomeController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          ()=> Stack(
          children: [
            LiquidSwipe(
              pages: homeController.itemDataList.map(
                    (e) => Container(
                      height: Get.height,
                      width: Get.width,
                      color: e.color,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(Get.width/10),
                            child: Image.asset(
                              e.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            e.text1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lobster(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
              ).toList(),
              positionSlideIcon: 0.8,
              fullTransitionValue: 880,
              slideIconWidget: const Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPageChangeCallback: (activePageIndex) {
                homeController.dotIndex.value = activePageIndex;
              },
              waveType: WaveType.liquidReveal,
              preferDragFromRevealedArea: true,
              enableSideReveal: true,
              ignoreUserGestureWhileAnimating: true,
              enableLoop: true,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.width/30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: homeController.itemDataList.asMap().entries.map((e) => Container(
                    height: e.key == homeController.dotIndex.value ? Get.width/30 : Get.width/50,
                    width: e.key == homeController.dotIndex.value ? Get.width/30 : Get.width/50,
                    margin: EdgeInsets.only(left: e.key == 0 ? 0 : Get.width/60,),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
