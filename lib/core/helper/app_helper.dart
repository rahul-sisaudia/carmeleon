import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/device_size.dart';
import 'package:carmeleon/aspects/dimensions/dimensions.dart';
import 'package:flutter/material.dart';

class AppHelper {
  static Future<void> showSimpleDialogue<T>({
    String btnTitle = 'Ok',
    required BuildContext context,
    String title = 'Alert',
    String message = '',
  }) async {
    await showDialog<T>(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: DeviceSize.width(context) / Dimensions.px3,
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.circular(Dimensions.px10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.px10, right: Dimensions.px10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: Dimensions.px10,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Dimensions.px10,
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Dimensions.px25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(child: Text(btnTitle)),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.px10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
