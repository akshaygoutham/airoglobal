import 'package:airoglobal_app/Screen/SecondPage.dart';
import 'package:airoglobal_app/api.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var arrayApi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  Future getApi() async {
    var rsp = await apiList();

    setState(() {
      arrayApi = rsp["data"];
      print(arrayApi);
    });
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("All Projects"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(
            Icons.more_horiz,
            size: 35,
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Search for project title or ID..",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: ListView.builder(
                    itemCount: arrayApi != null ? arrayApi.length : 0,
                    itemBuilder: (context, snapshot) {
                      final item = arrayApi != null ? arrayApi[snapshot] : null;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue[200],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  left: 2,
                                  top: 8,
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                      item['avatar'],
                                    ),
                                  )),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(
                                        'assets/project_menu1.png')),
                              ),
                              Positioned(
                                left: 80,
                                top: 20,
                                child: Text(
                                    "${item['first_name'].toString()} ${item['last_name'].toString()}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                              Positioned(
                                left: 80,
                                top: 50,
                                child: Text(item['email'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
