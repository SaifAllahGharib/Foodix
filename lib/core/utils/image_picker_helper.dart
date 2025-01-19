import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yummy_home/core/utils/permission_helper.dart';

class ImagePickerHelper {
  final ImagePicker _picker = ImagePicker();
  final PermissionHelper _permissionHelper = PermissionHelper();
  final Logger _logger = Logger();

  Future<File?> pickImageFromCamera() async {
    try {
      if (await _permissionHelper.isPermissionGranted(Permission.camera)) {
        final XFile? pickedFile =
            await _picker.pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          return File(pickedFile.path);
        }
      } else {
        await _permissionHelper.requestPermission(Permission.camera);
      }
    } catch (e, stackTrace) {
      _logger.e(
        "Error picking image from camera: ",
        error: e,
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  Future<File?> pickImageFromGallery() async {
    try {
      Permission permission;
      if (Platform.isAndroid && Platform.version.startsWith('3')) {
        permission = Permission.photos;
      } else {
        permission = Permission.storage;
      }

      if (await _permissionHelper.isPermissionGranted(permission)) {
        final XFile? pickedFile =
            await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          return File(pickedFile.path);
        }
      } else {
        await _permissionHelper.requestPermission(permission);
      }
    } catch (e, stackTrace) {
      _logger.e(
        "Error picking image from gallery: ",
        error: e,
        stackTrace: stackTrace,
      );
    }
    return null;
  }
}
