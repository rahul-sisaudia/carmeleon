import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../aspects/constants/constant_imports.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/helpers/helper_imports.dart';
import '../../core/notifiers/design_screen_provider.dart';
import 'build_buttons_view.dart';

class DisplayScreenMainButtonPallets extends StatefulWidget {
  final bool isColorPicker;
  final Function onSelectCarEnum;
  final CarEnum? bodyPart;

  DisplayScreenMainButtonPallets({
    required this.isColorPicker,
    required this.onSelectCarEnum,
    this.bodyPart,
  });

  @override
  State<DisplayScreenMainButtonPallets> createState() =>
      _DisplayScreenMainButtonPalletsState();
}

class _DisplayScreenMainButtonPalletsState
    extends State<DisplayScreenMainButtonPallets> {
  late DesignScreenProvider _designScreenProvider;


  void onUndoBtnTap() {
    if (_designScreenProvider.historyList.isNotEmpty) {
      _designScreenProvider.historyList.removeLast();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(" History List is empty ")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _designScreenProvider = Provider.of<DesignScreenProvider>(context);

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

  _buildDesignScreenButtonPallets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => widget.onSelectCarEnum(CarEnum.carRim),
          child: BuildButtonsView(
            icon: ((widget.bodyPart != null) &&
                (widget.bodyPart == CarEnum.carRim))
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
          onTap: () => widget.onSelectCarEnum(CarEnum.carBody),
          child: BuildButtonsView(
            icon: ((widget.bodyPart != null) &&
                (widget.bodyPart == CarEnum.carBody))
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

}
