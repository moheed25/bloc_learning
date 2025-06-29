import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/image_picker/image_picker_events.dart';
import 'package:bloc_learning/bloc/image_picker/image_picker_states.dart';
import 'package:bloc_learning/utils/image_picker_utils.dart' show ImagePickerUtils;
import 'package:equatable/equatable.dart';


import 'package:image_picker/image_picker.dart';






class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils ;
  ImagePickerBloc(
      this.imagePickerUtils
      ) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);
  }

  void _cameraCapture(CameraCapture event , Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryPicker(GalleryPicker event , Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}