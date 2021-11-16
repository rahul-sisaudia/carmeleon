import 'package:carmeleon/views/screens/CameraPreview.dart';
import 'package:carmeleon/views/screens/display_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';

import 'package:carmeleon/aspects/constants/color_constants.dart';
import 'package:carmeleon/aspects/constants/device_size.dart';
import 'package:carmeleon/aspects/dimensions/dimensions.dart';
import 'package:carmeleon/aspects/enum/body_enum.dart';
import 'package:carmeleon/core/notifiers/design_screen_provider.dart';

import 'build_buttons_view.dart';
import 'color_picker_Button_pallets.dart';

class ImageButtonPallets extends StatefulWidget {
  final bool isColorPicker;
  final DesignScreenProvider designScreenProvider;

  ImageButtonPallets({
    required this.designScreenProvider,
    required this.isColorPicker,
  });

  @override
  State<ImageButtonPallets> createState() => _ImageButtonPalletsState();
}

class _ImageButtonPalletsState extends State<ImageButtonPallets> {
  final ImagePicker _picker = ImagePicker();

  _buildDesignScreenButtonPallets() {
    return Column(
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
          child: BuildButtonsView().buildButtonPalletsView(
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
          child: BuildButtonsView().buildButtonPalletsView(
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
          child: BuildButtonsView().buildButtonPalletsView(
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
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.share,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onUndoBtnTap();
          },
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.undo_rounded,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  _buildColorPickerScreenButtonPallets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _cameraBtnClicked,
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.camera_enhance_outlined,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: _libraryBtnClicked,
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.photo_library_outlined,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.delete_outline,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.designScreenProvider.isDoneBtnClicked = true;
          },
          child: BuildButtonsView().buildButtonPalletsView(
            const Icon(
              Icons.done_rounded,
              size: Dimensions.px35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  _cameraBtnClicked() async {
    try {
      final _route = MaterialPageRoute(
        builder: (context) => CameraPreviewScreen(
          isColorPicker: widget.isColorPicker,
        ),
      );
      Navigator.of(context).push(_route);
    } catch (e) {
      print('_cameraBtnClicked error: $e');
    }
  }

  _libraryBtnClicked() async {
    try {
      final image = await _getImageFromGallery();
      if (image != null) {
        final _route = MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
            isColorPicker: widget.isColorPicker,
          ),
        );
        await Navigator.of(context).push(_route);
      }
    } catch (e) {
      print('_libraryBtnClicked error: $e');
    }
  }

  Future _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
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
      top: widget.designScreenProvider.isDoneBtnClicked
          ? DeviceSize.height(context) / 3.2
          : DeviceSize.height(context) / Dimensions.px5,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.transparentWhite,
          borderRadius: BorderRadius.circular(Dimensions.px15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          child: widget.isColorPicker
              ? widget.designScreenProvider.isDoneBtnClicked
                  ? ColorPickerButtonPallets(widget.designScreenProvider)
                  : _buildColorPickerScreenButtonPallets()
              : _buildDesignScreenButtonPallets(),
        ),
      ),
    );
  }
}
