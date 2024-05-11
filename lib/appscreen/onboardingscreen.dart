import "package:flutter/material.dart";
import "package:liquid_swipe/liquid_swipe.dart";
import "package:med_vista/authentication/login.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentpage = 0;
  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            slideIconWidget: const Icon(Icons.arrow_back_ios),
              liquidController: controller,
              onPageChangeCallback: onPageChangeCallback,
              pages: [
                onboarding1(size: size, controller: controller),
                onboarding2(size: size, controller: controller),
                onboarding3(size: size),
              ]
          ),
          Positioned(
            top: 60,
            right: 10,
            child: TextButton(
              onPressed: (){
                controller.jumpToPage(page: 2);
              },
              child: const Text("Skip",style: TextStyle(
                color: Colors.grey,
                fontSize: 17
              ),),
            ),
          ),
          Positioned(
            bottom: 15,
              child: AnimatedSmoothIndicator(
            activeIndex: controller.currentPage,
            count: 3,
                effect: const WormEffect(
                  dotHeight:5.0,
                  activeDotColor: Colors.orange
                ),

          ))
        ],
      ),
    );
  }
  void onPageChangeCallback(int activepageindex){
    setState(() {
      currentpage = activepageindex;
    });

  }
}

class onboarding3 extends StatelessWidget {
  const onboarding3({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        color: Colors.orange.shade200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: const AssetImage("assets/onboarding_img/onboarding3design-removebg-preview.png"),height: size.height * 0.4),
              const Column(
                children: [
                  Text("Optimal Health",style: TextStyle(
                      fontSize: 26,fontWeight: FontWeight.w900
                  ),),
                  Text("Gain immediate access to specialists within your proximity. Now,thats optimal health in a few clicks!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Get\nStarted!",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 70,
                    width: 100,
                    child: FloatingActionButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                    },
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.arrow_circle_right,color: Colors.orange,size: 60,),
                    ),
                  ),
                ],
              ),
              const Text("3/3",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17
              ),)
            ]
        )
    );
  }
}

class onboarding2 extends StatelessWidget {
  const onboarding2({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final LiquidController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        color: Colors.orange.shade100,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: const AssetImage("assets/onboarding_img/onboarding2design-removebg-preview.png"),height: size.height * 0.4),
              const Column(
                children: [
                  Text("Online Consultation",style: TextStyle(
                      fontSize: 26,fontWeight: FontWeight.w900
                  ),),
                  Text("We understand that you are short on time. Thud, our online consultation provides you best attentation on-the-go.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 70,
                width: 100,
                child: FloatingActionButton(onPressed: (){
                  int nextpage = controller.currentPage + 1;
                  controller.animateToPage(page: nextpage);
                },
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.arrow_circle_right,color: Colors.orange,size: 60,),
                ),
              ),
              const Text("2/3",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17
              ),)
            ]
        )
    );
  }
}

class onboarding1 extends StatelessWidget {
  const onboarding1({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final LiquidController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(image: const AssetImage("assets/onboarding_img/onboarding1design-removebg-preview-transformed.png"),height: size.height * 0.4),
        const Column(
          children: [
            Text("Skip the Queue",style: TextStyle(
              fontSize: 26,fontWeight: FontWeight.w900
            ),),
            Text("DoctorNow allows you book appointments online and avoid the usual long queues associated with hospital",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
        SizedBox(
          height: 70,
          width: 100,
          child: FloatingActionButton(onPressed: (){
            int nextpage = controller.currentPage + 1;
            controller.animateToPage(page: nextpage);
          },
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            child: const Icon(Icons.arrow_circle_right,color: Colors.orange,size: 60,),
          ),
        ),
        const Text("1/3",style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 17
        ),)
        ]
    )
    );
  }
}
