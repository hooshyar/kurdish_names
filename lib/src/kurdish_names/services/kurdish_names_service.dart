import 'package:http/http.dart' as http;
import 'package:kurdish_names/src/kurdish_names/models/names_data_model.dart';

class KurdishNamesService {
// https://github.com/DevelopersTree/nawikurdi
// https://nawikurdi.com/

//API end point : https://nawikurdi.com/api

  Future<KurdishNames> fetchListOfNames() async {
    //TODO: Create the URI
    // scheme : https , host: nawikurdi.com , path: api ,

// final httpsUri = Uri(
//     scheme: 'https',
//     host: 'dart.dev',
//     path: 'guides/libraries/library-tour',
//     fragment: 'numbers');
// print(httpsUri);

    Uri _kurdishNamesUri = Uri(
        scheme: 'https',
        host: 'nawikurdi.com',
        path: 'api',
        queryParameters: {"limit": "10", "gender": "F", "offset": "0"});

    http.Response _response = await http
        .get(Uri.parse('https://nawikurdi.com/api?limit=5&gender=F&offset=0'))
        .catchError((err) => print(err));

    KurdishNames _kurdishNames = KurdishNames.fromJson(_response.body);

    print(_response.body);
    return _kurdishNames;
  }
}
