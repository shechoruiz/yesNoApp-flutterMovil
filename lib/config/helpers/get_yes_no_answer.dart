import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  // Este ejercicio se realizará con dio como paquete de consumo de APIs
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // Este es un ejemplo claro de un mapeo de datos
    // return Message(
    //     text: response.data['answer'],
    //     fromWho: FromWho.hers,
    //     imageUrl: response.data['image']);
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
