import 'package:digitalsociety/Screens/chairman_login.dart';
import 'package:digitalsociety/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimPage extends StatefulWidget {
  const AnimPage({super.key});

  @override
  State<AnimPage> createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage> {
  List images = ["city.jpeg", "city3.jpeg", 'city2.jpeg'];
  PageController controller = PageController();
  bool lastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      onPageChanged: (value) {
        setState(() {
          lastpage = value == 2;
        });
      },
      controller: controller,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/" + images[index]),
                fit: BoxFit.cover),
          ),
          child: Container(
            padding: EdgeInsets.only(bottom: 50, right: 20, left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.animateToPage(2,
                        duration: Duration(seconds: 1), curve: Curves.linear);

                    Text("Get Started");
                  },
                  child: lastpage
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen()));
                                },
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Skip",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                SmoothPageIndicator(
                                  controller: controller,
                                  count: images.length,
                                  effect: ExpandingDotsEffect(
                                    dotWidth: 12,
                                    dotHeight: 10,
                                      activeDotColor: Colors.white,
                                      dotColor: Colors.grey.shade900),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.decelerate);
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
