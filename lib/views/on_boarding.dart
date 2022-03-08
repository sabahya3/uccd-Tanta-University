
import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/views/admin_screens/admin_or_user.dart';
import 'package:secound_version/widgets/txt_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _currentIndex = 0;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              _controller.jumpToPage(splashData.length);
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      'UCCD',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                     SizedBox(
                      height: height*0.05,
                    ),
                    SizedBox(
                      width:width,
                      height:height * 0.10,
                      child: Text(
                        splashData[index]['text'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black45),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: width,
                        height:height * 0.25,
                        child: Image.asset(splashData[index]['image']))
                  ],
                ),
              ),
            ),
             SizedBox(
              height:height*0.05,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin: const EdgeInsets.only(right: 4),
                          width: _currentIndex == index ? 40 : 13,
                          height: 6,
                          decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? primaryColor
                                  : const Color(0xffd8d8d8),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  DefaultButton(
                      text: _currentIndex == splashData.length - 1
                          ? 'Continue'
                          : 'Next',
                      onPressed: () {
                        if (_currentIndex == splashData.length - 1) {
                   NavigationService.instance.goToAndReplace(context,const AdminOrUser());
                        }
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut);
                      }),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
