import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_in_flutter/data_class.dart';
import 'package:provider_in_flutter/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFfefcff),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Consumer<DataClass>(builder: (context, data, child) {
                  return Text('${data.x}');
                }),
                const Spacer(),
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 40),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 60,
                      height: 60,
                      child: const Icon(Icons.add),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xFF716f72), width: 1)),
                    ),
                    onTap: () {
                      if (context.read<DataClass>().x >= 5) {
                        Get.snackbar("Item", "Can not more than this",
                            backgroundColor: Colors.black,
                            colorText: Colors.white,
                            titleText: Text(
                              "Item",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ));
                      } else {
                        context.read<DataClass>().incrementX();
                      }
                    },
                  ),
                  const Spacer(),
                  Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.to(() => SecondPage(),
                                      transition: Transition.upToDown,
                                      duration: Duration(seconds: 1));
                                },
                                child: const Text(
                                  "Next Page",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                            const Spacer(),
                            const Icon(Icons.skip_next, color: Colors.white)
                          ],
                        ),
                      ))
                ],
              ))
        ]));
  }
}
