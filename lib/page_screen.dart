import 'package:flutter/material.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({super.key});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  List<Widget> pages = [
    Center(child: Text("page1")),
    Center(child: Text("page2")),
    Center(child: Text("page3")),
  ];
  int currentIndex = 0;

  List<String> words = [
    "page1",
    "page1",
    "page3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(pages.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 60,
                        color:
                            currentIndex == index ? Colors.blue : Colors.black,
                        child: Text(
                          "Ok",
                          style: TextStyle(
                              color: currentIndex == index
                                  ? Colors.white
                                  : Colors.green),
                        ),
                      ),
                    );
                  })
                ],
              ),
              if(currentIndex==0) pages[currentIndex],
              if (currentIndex == 1) pages[currentIndex],
              if (currentIndex == 2) pages[currentIndex],
            ],
          ),
        ),
      ),
    );
  }
}
