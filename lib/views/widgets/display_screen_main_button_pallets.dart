import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../aspects/constants/constant_imports.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/helpers/helper_imports.dart';
import '../../core/notifiers/design_screen_provider.dart';
import 'icon_button_view.dart';

class DisplayScreenMainButtonPallets extends StatefulWidget {
  final bool isColorPicker;
  final Function onSelectCarEnum;
  final VoidCallback? onSaveBtnClicked;
  final CarEnum? selBodyPart;

  DisplayScreenMainButtonPallets({
    required this.isColorPicker,
    required this.onSelectCarEnum,
    this.onSaveBtnClicked,
    this.selBodyPart,
  });

  @override
  State<DisplayScreenMainButtonPallets> createState() =>
      _DisplayScreenMainButtonPalletsState();
}

class _DisplayScreenMainButtonPalletsState
    extends State<DisplayScreenMainButtonPallets> {
  late DesignScreenProvider _designScreenProvider;

  void _undoBtnTapped() {
    if (_designScreenProvider.historyList.isNotEmpty) {
      _designScreenProvider.historyList.removeLast();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(' History List is empty ')),
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
          padding: const EdgeInsets.all(5),
          child: _buildDesignScreenButtonPallets(),
        ),
      ),
    );
  }

  _buildDesignScreenButtonPallets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButtonView(
          icon: Icons.stars_outlined,
          color: ((widget.selBodyPart != null) &&
                  (widget.selBodyPart == CarEnum.carRim))
              ? Colors.blue
              : Colors.black,
          onTap: () => widget.onSelectCarEnum(CarEnum.carRim),
        ),
        IconButtonView(
          icon: Icons.car_repair_rounded,
          color: ((widget.selBodyPart != null) &&
                  (widget.selBodyPart == CarEnum.carBody))
              ? Colors.blue
              : Colors.black,
          onTap: () => widget.onSelectCarEnum(CarEnum.carBody),
        ),
        IconButtonView(
          icon: Icons.save,
          color: Colors.black,
          onTap: widget.onSaveBtnClicked,
        ),
        IconButtonView(
          icon: Icons.share,
          color: Colors.black,
          onTap: () {
            Share.share('Share Carmeleon App');
          },
        ),
        IconButtonView(
          icon: Icons.undo_rounded,
          color: Colors.black,
          onTap: _undoBtnTapped,
        ),
      ],
    );
  }
}
