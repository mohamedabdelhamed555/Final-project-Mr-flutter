import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';

final riveArtboardCubit = RiveArtboardCubit();

class RiveArtboardCubit extends Cubit<Artboard?> {
  RiveArtboardCubit() : super(null);

  void setArtboard(Artboard? artboard) {
    emit(artboard);
  }
}
