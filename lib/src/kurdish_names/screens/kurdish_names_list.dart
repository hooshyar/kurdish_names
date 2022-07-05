import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kurdish_names/src/kurdish_names/models/names_data_model.dart';
import 'package:kurdish_names/src/kurdish_names/services/kurdish_names_service.dart';

class KurdishNamesList extends StatelessWidget {
  KurdishNamesList({Key? key}) : super(key: key);

  KurdishNamesService _namesService = KurdishNamesService();
//TODO: create the datamodel : done

//TODO: create  a class for the kurdish names service : done

//TODO: create a method to get the list of kurdish names : half done

//TODO: render the list of users to the screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Gender '),
                Text('Sort by '),
                Text('Limit '),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.red,
              padding: EdgeInsets.all(20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: FutureBuilder<KurdishNames>(
                  future: _namesService.fetchListOfNames(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CupertinoActivityIndicator();
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (snapshot.data == null) {
                      return Text('no data');
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.names.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            leading: Text(snapshot
                                .data!.names[index].positive_votes
                                .toString()),
                            title: Text(snapshot.data!.names[index].name),
                            children: [Text(snapshot.data!.names[index].desc)],
                          );
                        });
                  }),
                ),
              ),
              // child: ,
            ),
          )
        ],
      ),
    );
  }
}
