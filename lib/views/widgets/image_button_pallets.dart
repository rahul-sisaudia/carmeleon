import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../aspects/constants/contant_imports.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/helpers/helper_imports.dart';
import '../../core/notifiers/design_screen_provider.dart';
import 'build_buttons_view.dart';

class ImageButtonPallets extends StatefulWidget {
  final bool isColorPicker;
  final DesignScreenProvider designScreenProvider;
  final VoidCallback onSelectCarEnum;

  ImageButtonPallets({
    required this.designScreenProvider,
    required this.isColorPicker,
    required this.onSelectCarEnum,
  });

  @override
  State<ImageButtonPallets> createState() => _ImageButtonPalletsState();
}

class _ImageButtonPalletsState extends State<ImageButtonPallets> {
  _buildDesignScreenButtonPallets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => widget.onSelectCarEnum(),
          child: BuildButtonsView(
            icon: widget.designScreenProvider.bodyPart == CarEnum.carRim
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
          child: BuildButtonsView(
            icon: widget.designScreenProvider.bodyPart == CarEnum.carBody
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
          child: BuildButtonsView(
            icon: const Icon(
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
          child: BuildButtonsView(
            icon: const Icon(
              Icons.share,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: onUndoBtnTap,
          child: BuildButtonsView(
            icon: const Icon(
              Icons.undo_rounded,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void onUndoBtnTap() {
    if (widget.designScreenProvider.historyList.isNotEmpty) {
      widget.designScreenProvider.historyList.removeLast();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(" History List is empty ")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Dimensions.px10,
      top: DeviceSizeHelper.height(context) / Dimensions.px5,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.transparentWhite,
          borderRadius: BorderRadius.circular(Dimensions.px15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          child: _buildDesignScreenButtonPallets(),
        ),
      ),
    );
  }
}
