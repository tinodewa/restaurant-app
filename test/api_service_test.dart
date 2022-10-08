import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurantapp/data/api/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:restaurantapp/data/model/restaurant_detail_result.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group(
    'Fetch Restaurants',
    () {
      test(
        'Should contain parsed data from API',
        () async {
          //setup
          final client = MockClient();

          //act
          // Use Mockito to return a successful response when it calls the
          // provided http.Client.
          when(client.get(Uri.parse(
                  'https://restaurant-api.dicoding.dev/detail/rqdv5juczeskfw1e867')))
              .thenAnswer((_) async => http.Response(
                  '{"error":false,"message":"success","restaurant":{"id":"rqdv5juczeskfw1e867","name":"Melting Pot","description":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.","city":"Medan","address":"Jln. Pandeglang no 19","pictureId":"14","rating":4.2,"categories":[{"name":"Italia"},{"name":"Modern"}],"menus":{"foods":[{"name":"Paket rosemary"},{"name":"Toastie salmon"},{"name":"Bebek crepes"},{"name":"Salad lengkeng"}],"drinks":[{"name":"Es krim"},{"name":"Sirup"},{"name":"Jus apel"},{"name":"Jus jeruk"},{"name":"Coklat panas"},{"name":"Air"},{"name":"Es kopi"},{"name":"Jus alpukat"},{"name":"Jus mangga"},{"name":"Teh manis"},{"name":"Kopi espresso"},{"name":"Minuman soda"},{"name":"Jus tomat"}]},"customerReviews":[{"name":"Ahmad","review":"Tidak rekomendasi untuk pelajar!","date":"13 November 2019"},{"name":"ucok","review":"adasdasd","date":"8 Oktober 2022"},{"name":"sad","review":"asdasdasd","date":"8 Oktober 2022"},{"name":"asd","review":"asdasdasd","date":"8 Oktober 2022"},{"name":"dsadsad","review":"wqewqewq","date":"8 Oktober 2022"},{"name":"dsadsad","review":"wqewqewq","date":"8 Oktober 2022"},{"name":"ewqewq","review":"ewqewq","date":"8 Oktober 2022"},{"name":"11111111111","review":"1111111111111","date":"8 Oktober 2022"},{"name":"sdads","review":"adsadsadsa","date":"8 Oktober 2022"},{"name":"111111111","review":"111111111111111111111","date":"8 Oktober 2022"},{"name":"hwlo hwlo","review":"hwlo","date":"8 Oktober 2022"},{"name":"asdf","review":"asdf","date":"8 Oktober 2022"},{"name":"asdf","review":"asdf","date":"8 Oktober 2022"},{"name":"hwlo world","review":"hwwlo world","date":"8 Oktober 2022"},{"name":"Coba","review":"harap coba lagi","date":"8 Oktober 2022"}]}}',
                  200));

          //assert
          expect(await testFutureGetDetailRestaurant(client),
              isA<RestaurantDetailResult>());
        },
      );

      test(
        'Throw an exception if the http call completes with an error',
        () {
          //setup
          final client = MockClient();

          //act
          // Use Mockito to return an unsuccessful response when it calls the
          // provided http.Client.
          when(client.get(Uri.parse(
                  'https://restaurant-api.dicoding.dev/detail/rqdv5juczeskfw1e867')))
              .thenAnswer((_) async => http.Response('Not Found', 404));

          //assert
          expect(testFutureGetDetailRestaurant(client), throwsException);
        },
      );
    },
  );
}
