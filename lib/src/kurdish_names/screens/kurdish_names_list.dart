import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kurdish_names/src/kurdish_names/models/names_data_model.dart';
import 'package:kurdish_names/src/kurdish_names/services/kurdish_names_service.dart';

class KurdishNamesList extends StatefulWidget {
  KurdishNamesList({Key? key}) : super(key: key);

  @override
  State<KurdishNamesList> createState() => _KurdishNamesListState();
}

class _KurdishNamesListState extends State<KurdishNamesList> {
  KurdishNamesService _namesService = KurdishNamesService();

  // varibale to change the gender for list of names
  String gender = 'F';

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
                GestureDetector(
                  child: Text('Gender '),
                  onTap: () => setState(() {
                    if (gender == 'M') {
                      gender = 'F';
                    } else if (gender == 'F') {
                      gender = 'M';
                    }
                  }),
                ),
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
                  future: _namesService.fetchListOfNames(gender),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('loading...');
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (snapshot.data == null) {
                      return Text('no data');
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.names.length,
                        itemBuilder: (context, index) {
                          Name _name = snapshot.data!.names[index];

                          return ExpansionTile(
                            leading: SelectableText(_name.nameId.toString()),
                            title: Text(_name.name),
                            children: [
                              Text(_name.desc),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () async {
                                        await _namesService
                                            .vote(
                                                name_id:
                                                    _name.nameId.toString(),
                                                isPositive: true)
                                            .then((value) {
                                          setState(() {});
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                      icon: Icon(Icons.thumb_up_sharp),
                                      label: Text(
                                          _name.positive_votes.toString())),
                                  ElevatedButton.icon(
                                      onPressed: () async {
                                        await _namesService
                                            .vote(
                                                name_id:
                                                    _name.nameId.toString(),
                                                isPositive: false)
                                            .then(
                                          (value) {
                                            setState(() {});
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      icon: Icon(Icons.thumb_down_sharp),
                                      label: Row(
                                        children: [
                                          Text(_name.negative_votes.toString()),
                                        ],
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
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
