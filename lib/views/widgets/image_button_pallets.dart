import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/device_size.dart';
import 'package:carmeleon/aspects/dimensions/dimensions.dart';
import 'package:carmeleon/aspects/enum/body_enum.dart';
import 'package:carmeleon/core/history_list/history_list.dart';
import 'package:carmeleon/core/notifiers/design_screen_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ImageButtonPallets extends StatefulWidget {
  final DesignScreenProvider designScreenProvider;
  ImageButtonPallets({Key? key, required this.designScreenProvider})
      : super(key: key);
  @override
  State<ImageButtonPallets> createState() => _ImageButtonPalletsState();
}

class _ImageButtonPalletsState extends State<ImageButtonPallets> {
  void onUndoBtnTap() {
    if (HistoryList.historyList.isNotEmpty) {
      HistoryList.historyList.removeLast();

      //<<<<<<<<<<<<<<<<<<<<<<<< print List Data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      for (int i = 0; i < HistoryList.historyList.length; i++) {
        print('${HistoryList.historyList[i].bodyPart} => ' +
            '${HistoryList.historyList[i].colorCode}');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(" History List is empty ")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: DeviceSize.height(context) / Dimensions.px5,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.transparentWhite,
          borderRadius: BorderRadius.circular(Dimensions.px15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.designScreenProvider.bodyPart != CarEnum.carRim) {
                    widget.designScreenProvider.bodyPart = CarEnum.carRim;
                  } else {
                    widget.designScreenProvider.bodyPart = null;
                  }
                },
                child: _buildButtonPalletsView(
                  widget.designScreenProvider.bodyPart == CarEnum.carRim
                      ? const Icon(
                          Icons.stars_outlined,
                          size: Dimensions.px35,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.stars_outlined,
                          size: Dimensions.px35,
                          color: Colors.black,
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.designScreenProvider.bodyPart != CarEnum.carBody) {
                    widget.designScreenProvider.bodyPart = CarEnum.carBody;
                  } else {
                    widget.designScreenProvider.bodyPart = null;
                  }
                },
                child: _buildButtonPalletsView(
                  widget.designScreenProvider.bodyPart == CarEnum.carBody
                      ? const Icon(
                          Icons.car_repair_rounded,
                          size: Dimensions.px35,
                          color: Colors.blue,
                        )
                      : const Icon(
                          Icons.car_repair_rounded,
                          size: Dimensions.px35,
                          color: Colors.black,
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: _buildButtonPalletsView(
                  const Icon(
                    Icons.save,
                    size: Dimensions.px35,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Share.share('Share Carmeleon App');
                },
                child: _buildButtonPalletsView(
                  const Icon(
                    Icons.share,
                    size: Dimensions.px35,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap undo Btn gesture');
                  onUndoBtnTap();
                },
                child: _buildButtonPalletsView(
                  const Icon(
                    Icons.undo_rounded,
                    size: Dimensions.px35,
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
