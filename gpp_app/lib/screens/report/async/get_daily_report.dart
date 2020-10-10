import 'package:dio/dio.dart';
import 'package:gpp_app/models/json/daily_report.dart';
import 'package:gpp_app/models/network/dio_client.dart';
import 'package:gpp_app/models/network/user_auth_interceptor.dart';
import 'package:gpp_app/util/my_logger.dart';

Future<DailyReport> getDailyReport(String uri, String date) async {
  Dio _dio = Dio();
  final DioClient dioClient = DioClient(_dio);
  Response response;
  try {
    response = await dioClient.get(
      uri,
      queryParameters: {
        'date': date,
      },
      interceptor: UserAuthInterceptor(_dio),
    );
    // Handling exception
  } on DioError catch (e) {
    if (e.response != null) {
      MyLogger.error(
          'GET daily report failed. Status code is ${e.response.statusCode}');
      throw e;
    } else {
      MyLogger.error(
          'GET daily report failed. Error.response is null.\nrequest: ${e.request}\nmessage: ${e.message}');
      throw e;
    }
  }

  // GET Successed
  if (response != null && response.statusCode == 200) {
    MyLogger.info('GET daily report successed');

    MyLogger.debug('dailyReport response.data : ${response.data}');

    // Parse json to return value
    return DailyReport.fromJson(response.data);
  } else {
    MyLogger.error('GET daily report response is invalid');
    throw DioError(type: DioErrorType.RESPONSE);
  }
}
