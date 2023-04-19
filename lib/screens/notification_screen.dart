import 'package:flutter/material.dart';
import 'package:jv_services/utils/extensions/goto.dart';
import 'package:jv_services/widget/base_widget.dart';

import '../constant/poppins_common_text.dart';
import '../view_models/notification_screen_vm.dart';

class NotificationScreen extends BaseWidget<NotificationScreenVM>{
  const NotificationScreen({super.key});

  @override
  Widget buildUI(BuildContext context, NotificationScreenVM viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.adaptive.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: const PoppinsAddText(
            text: "Notification",
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )),
      body: ListView.builder(
          itemCount: 13,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index1) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 0),
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xffe3e3e3)),
                          height: 50,
                          width: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Icon(Icons.notifications),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const PoppinsAddText(
                              text: "Refer & Earn more",
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Bhel Nagar, Piplani, Ayodhya Bypass, Bhopal, Madhya Pradesh 462022, India ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const PoppinsAddText(
                              text: "Thu 21 Apr",
                              fontSize: 12,
                              textAlign: TextAlign.start,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
              ],
            );
          }),
    );
  }

}