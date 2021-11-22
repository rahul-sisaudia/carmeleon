import 'dart:io';

import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../aspects/constants/color_constants.dart';
import '../../aspects/enum/body_enum.dart';
import '../../core/helpers/routing_helper.dart';
import '../../core/notifiers/design_screen_provider.dart';
import '../widgets/color_pallets.dart';
import '../widgets/image_button_pallets.dart';
import 'camera_screen.dart';

class DisplayPictureScreen extends StatefulWidget {
  final bool isColorPicker;
  final String imagePath;

  DisplayPictureScreen({
    required this.imagePath,
    required this.isColorPicker,
  });

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  late DesignScreenProvider _designScreenProvider;

  _onAddColorTap() async {
    RoutingHelper.pushToScreen(
      ctx: context,
      screen: CameraScreen(isForColorPicker: true),
    );
  }

  _onScreenTap() {
    if (!_designScreenProvider.isOptionVisible) {
      _designScreenProvider.isOptionVisible = true;
    } else {
      _designScreenProvider.isOptionVisible = false;
    }
  }

  @override
  void initState() {
    _designScreenProvider = DesignScreenProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EyeDrop(
      child: ChangeNotifierProvider<DesignScreenProvider>.value(
        value: _designScreenProvider,
        child: Consumer<DesignScreenProvider>(
          builder: (_, _designScreenProvider, __) {
            return Scaffold(
              body: Stack(
                children: [
                  GestureDetector(
                    onTap: _onScreenTap,
                    child: Container(
                      color: ColorConstants.white,
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.file(
                        File(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (_designScreenProvider.isOptionVisible)
                    ImageButtonPallets(
                      onSelectCarEnum: _onSelectCarEnum,
                      designScreenProvider: _designScreenProvider,
                      isColorPicker: widget.isColorPicker,
                    ),
                  if (_designScreenProvider.isOptionVisible &&
                      (_designScreenProvider.bodyPart == CarEnum.carBody ||
                          _designScreenProvider.bodyPart == CarEnum.carRim ||
                          _designScreenProvider.isDoneBtnClicked))
                    ColorPallets(
                      onAddColorBtnTap: _onAddColorTap,
                      isShowAddColorBtn: true,
                      designScreenProvider: _designScreenProvider,
                      isColorPicker: widget.isColorPicker,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onSelectCarEnum() {
    if (_designScreenProvider.bodyPart != CarEnum.carRim) {
      _designScreenProvider.bodyPart = CarEnum.carRim;
    } else {
      _designScreenProvider.bodyPart = null;
    }
  }
}
