import 'package:finished_games_register/app/styles/system_pop_ups.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:finished_games_register/app/modules/list/list_store.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
    as gradientComp;
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({key, this.title = 'ListPage'}) : super(key: key);
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends ModularState<ListPage, ListStore> {
  final ListStore store = Modular.get<ListStore>();

  final _refresh = GlobalKey<FormState>();

  Future<bool> _futureLoadLists;

  final colorInit = 0xFFde6262;
  final colorEnd = 0xFFffb88c;

  @override
  void initState(){
    _futureLoadLists = store.getSelected();
    super.initState();
  }

  Future _onItemTapped(int index) async {
    setState(() {
      store.setIndex(index);
    });
  }

  Future refreshList() async {
    setState(() {
      _futureLoadLists = store.getSelected();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    store.getCredential();
    store.getSelected();

    Widget listComponents(context) {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            //_futureLoadLists == false ? store.crudListsFailed(fullMediaWidth, fullMediaHeight) : store.crudLists(fullMediaWidth, fullMediaHeight),
            FutureBuilder(
              future: _futureLoadLists,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return store.crudListsWaiting(fullMediaWidth, fullMediaHeight);
                  case ConnectionState.done:
                    if (snapshot.data == false) {
                      return new RefreshIndicator(
                          key:_refresh,
                          color: Colors.blue,
                          onRefresh: refreshList,
                      child: store.crudListsFailed(fullMediaWidth, fullMediaHeight),
                      );
                    }
                    if (snapshot.data == true) {}
                    return new RefreshIndicator(
                        key: _refresh,
                        color: Colors.blue,
                        onRefresh: refreshList,
                    child: store.crudLists(fullMediaWidth, fullMediaHeight),
                    );
                      //store.crudLists(fullMediaWidth, fullMediaHeight);
                    break;
                  default:
                    return null;
                }
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: gradientComp.appBarGradient(context, "Finished Games"),
      body: gradientComp.backgroundGradient(context, listComponents(context)),
      bottomNavigationBar: gradientComp.containerGradient(
        context,
        BottomNavigationBar(
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          //ype: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Publisher',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.app_registration),
              label: 'Register',
            ),
          ],
          currentIndex: store.selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF13213b),
        onPressed: () async {
          await store.openCrud();
        },
        child: Icon(Icons.my_library_add),
      ),
    );
  }
}
