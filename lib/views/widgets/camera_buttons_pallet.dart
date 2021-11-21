import 'package:flutter/material.dart';

import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/core/helper/helper_imports.dart';

class CameraButtonsPallet extends StatefulWidget {
  final VoidCallback cameraBtnClicked;
  final VoidCallback libraryBtnClicked;

  CameraButtonsPallet({
    required this.cameraBtnClicked,
    required this.libraryBtnClicked,
  });

  @override
  State<CameraButtonsPallet> createState() => _CameraButtonsPalletState();
}

class _CameraButtonsPalletState extends State<CameraButtonsPallet> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: DeviceSizeHelper.width(context) / 100,
      top: DeviceSizeHelper.height(context) / 2.6,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.transparentWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 8, left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: widget.cameraBtnClicked,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.camera_enhance_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: widget.libraryBtnClicked,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.photo_library_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
