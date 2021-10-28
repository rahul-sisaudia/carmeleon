import 'package:carmeleon/constants/color_constants.dart';
import 'package:carmeleon/constants/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageButtonPallets extends StatefulWidget {
  const ImageButtonPallets({Key? key}) : super(key: key);

  @override
  State<ImageButtonPallets> createState() => _ImageButtonPalletsState();
}

class _ImageButtonPalletsState extends State<ImageButtonPallets> {
  bool isRimSelected = false;
  bool isBodySelected = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: DeviceSize.height(context) / 5,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.transparentWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!isRimSelected)
                      isRimSelected = true;
                    else {
                      isRimSelected = false;
                    }
                  });
                },
                child: _buildButtonPalletsView(
                  isRimSelected
                      ? const Icon(
                          Icons.stars_outlined,
                          size: 35,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.stars_outlined,
                          size: 35,
                          color: Colors.black,
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!isBodySelected)
                      isBodySelected = true;
                    else {
                      isBodySelected = false;
                    }
                  });
                },
                child: _buildButtonPalletsView(
                  isBodySelected
                      ? const Icon(
                          Icons.car_repair_rounded,
                          size: 35,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.car_repair_rounded,
                          size: 35,
                          color: Colors.black,
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: _buildButtonPalletsView(
                  const Icon(
                    Icons.save,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap 3 gesture');
                },
                child: _buildButtonPalletsView(
                  const Icon(
                    Icons.share,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap 4 gesture');
                },
                child: _buildButtonPalletsView(
                  const Icon(
                    Icons.undo_rounded,
                    size: 35,
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

  _buildButtonPalletsView(Widget icon) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: icon,
        ),
      ),
    );
  }
}
