import 'package:http/http.dart' as http;
import 'package:kurdish_names/src/kurdish_names/models/names_data_model.dart';

class KurdishNamesService {
  Future<KurdishNames> fetchListOfNames(String gender) async {
    //TODO: Create the URI
    // scheme : https , host: nawikurdi.com , path: api ,

// final httpsUri = Uri(
//     scheme: 'https',
//     host: 'dart.dev',
//     path: 'guides/libraries/library-tour',
//     fragment: 'numbers');
// print(httpsUri);

    // Uri _kurdishNamesUri = Uri(
    //     scheme: 'https',
    //     host: 'nawikurdi.com',
    //     path: 'api',
    //     queryParameters: {"limit": "10", "gender": gender, "offset": "0"});

    http.Response _response = await http
        .get(Uri.parse(
            'https://nawikurdi.com/api?limit=20&gender=$gender&offset=0'))
        .catchError((err) => print(err));

    KurdishNames _kurdishNames = KurdishNames.fromJson(_response.body);
    return _kurdishNames;
  }

//to use vote up without making things complicated
  Future voteUp({required String name_id}) async {
    await http.post(Uri.parse("https://nawikurdi.com/api/vote"), body: {
      "name_id": name_id,
      "uid": "sdafadsdsafsdfasd",
      "impact": "positive"
    });
  }

//to use vote down without making things complicated
  Future voteDown({required String name_id}) async {
    await http.post(Uri.parse("https://nawikurdi.com/api/vote"), body: {
      "name_id": name_id,
      "uid": "sdafadsdsafsdfasd",
      "impact": "negative"
    });
  }

  //to have both functionalities on one method
  Future vote({
    required String name_id,
    required bool isPositive,
  }) async {
    String _impact = isPositive == true ? "positive" : "negative";

    await http.post(Uri.parse("https://nawikurdi.com/api/vote"), body: {
      "name_id": name_id,
      "uid": "sdafadsdsafsdfasd",
      "impact": _impact
    });
  }
}
