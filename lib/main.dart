import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
void main() {
  runApp(
      const MaterialApp(
        home: LiquidScreen(),
      ));
}

class LiquidScreen extends StatefulWidget {
  const LiquidScreen({Key? key}) : super(key: key);

  @override
  State<LiquidScreen> createState() => _LiquidScreenState();
}

class _LiquidScreenState extends State<LiquidScreen> {

  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: controller,
            enableSideReveal: true,
            onPageChangeCallback: (index){
              setState(() {
              });
            },
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            pages: [
              Container(
                color: Colors.black,
                  child: const Center(child: Text('Page 1',style: TextStyle(color: Colors.white,),),),
              ),
              Container(
                color: Colors.blue.shade800,
                child: const Center(child: Text('Page 2')),
              ),
              Container(
                color: Colors.deepPurple.shade900,
                child: const Center(child: Text('Page 3')),
              ),
              Container(
                color: Colors.blueAccent,
                child: const Center(child: Text('Page 4')),
              ),
            ],
          ),

          Positioned(
              bottom: 0,
              left: 16,
              right:32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                    controller.jumpToPage(page: 3);
                    },
                    child: const Text('SKIP'),),
                  AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage,
                      count: 4,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.white54,
                        activeDotColor: Colors.white
                      ),
                    onDotClicked: (index) {
                        controller.animateToPage(page: index);
                    },
                  ),

                  TextButton(
                    onPressed: () {
                    final page = controller.currentPage + 1;
                    controller.animateToPage(
                        page: page > 4 ? 0 : page,
                        duration: 400);
                    }, child: const Text('NEXT'),),
                ],
              ))
        ],
      )
    );
  }
}
