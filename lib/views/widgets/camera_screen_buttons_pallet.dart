import 'package:flutter/material.dart';

import '../../aspects/constants/color_constants.dart';
import '../../core/helpers/helper_imports.dart';

class CameraScreenButtonsPallet extends StatefulWidget {
  final VoidCallback cameraBtnClicked;
  final VoidCallback libraryBtnClicked;

  CameraScreenButtonsPallet({
    required this.cameraBtnClicked,
    required this.libraryBtnClicked,
  });

  @override
  State<CameraScreenButtonsPallet> createState() =>
      _CameraScreenButtonsPalletState();
}

class _CameraScreenButtonsPalletState extends State<CameraScreenButtonsPallet> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: SizeHelper.getDeviceWidth(context) / 100,
      top: SizeHelper.getDeviceHeight(context) / 2.6,
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
