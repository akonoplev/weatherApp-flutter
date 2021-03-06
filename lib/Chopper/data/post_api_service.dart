import 'package:chopper/chopper.dart';
import 'package:firstFlutterApp/Chopper/data/mobile_data_interceptor.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {

  @Get()
  Future<Response> getPosts();

  @Get(path: "/{id}")
  Future<Response> getPost(@Path("id") int id);
  //Future<Response> getPost(@Path("id") int id, @Query('q') String name); with query parameters

//  @Post()
//  @Put()
//  @Putch()

  @Post()
  Future<Response> postPost(
      @Body() Map<String, dynamic> body
      );

  static PostApiService create() {
    final client = ChopperClient(
        baseUrl: "https://jsonplaceholder.typicode.com",
        services: [
          _$PostApiService(),
        ],
        converter: JsonConverter(),
        interceptors: [
          HeadersInterceptor({'Cache-Control': 'no-cache'}),
          //HttpLoggingInterceptor(),
          CurlInterceptor(),
          (Request request) async {
            if (request.method == HttpMethod.Post) {
              chopperLogger.info('Performed a POST request');
            }
            return request;
          },
          (Response response) async {
            if (response.statusCode == 200) {
            chopperLogger.info("status code 200");
           } else if (response.statusCode == 404) {
              chopperLogger.severe("404 NOT FOUND");
            }
            return response;
          },
          MobileDataInterceptor()
          ]
    );
    return _$PostApiService(client);
  }
}





//MARK: - create file part
//flutter packages pub run build_runner watch