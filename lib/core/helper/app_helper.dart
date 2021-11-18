import 'dart:ui';

import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/device_size.dart';
import 'package:carmeleon/aspects/dimensions/dimensions.dart';
import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppHelper {
  static Future<void> showSimpleDialogue<T>({
    bool showOkayButton = false,
    bool showNoButton = false,
    String cancelBtnTitle = 'cancel',
    String okBtnTitle = 'Ok',
    required BuildContext context,
    String title = 'Alert',
    String message = '',
    Function? onClick,
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
                        style: AppTextStyles.semiBoldText(
                          fontSize: 18,
                          color: ColorConstants.black,
                          decoration: false,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.px10,
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regularText(
                          fontSize: 14,
                          color: ColorConstants.black,
                          decoration: false,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.px25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          if (showNoButton)
                            GestureDetector(
                              child: Container(
                                child: Text(
                                  cancelBtnTitle,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.semiBoldText(
                                    fontSize: 14,
                                    color: ColorConstants.black,
                                    decoration: false,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          // Spacer(),
                          if (showOkayButton)
                            GestureDetector(
                              child: Container(
                                child: Text(
                                  okBtnTitle,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.semiBoldText(
                                    fontSize: 14,
                                    color: ColorConstants.black,
                                    decoration: false,
                                  ),
                                ),
                              ),
                              onTap: () {
                                onClick!.call();
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
