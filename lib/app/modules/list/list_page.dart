import 'package:finished_games_register/app/modules/list/widgets/lists.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

class ListPageState extends ModularState<ListPage, ListStore>{
  final ListStore store = Modular.get<ListStore>();

  final _refresh = GlobalKey<FormState>();

  @override
  void initState() {
    store.refreshList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    Widget listComponents(context) {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Observer(builder: (_){
              return FutureBuilder(
                future: store.futureLoadLists,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == false) {
                      return new RefreshIndicator(
                        key: _refresh,
                        color: Colors.blue,
                        onRefresh: store.refreshList,
                        child: listsWhenFailed(
                            fullMediaWidth, fullMediaHeight),
                      );
                    }else{
                      return new RefreshIndicator(
                        key: _refresh,
                        color: Colors.blue,
                        onRefresh: store.refreshList,
                        child: Observer(
                          builder: (_){
                            return showLists(fullMediaWidth, fullMediaHeight, store);
                          },
                        ),
                      );
                    }
                  }else{
                    return crudListsWaiting(
                        fullMediaWidth, fullMediaHeight);
                  }
                },
              );
            }),

          ],
        ),
      );
    }

    return Observer(
        builder: (_) {
          return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                appBar: gradientComp.appBarGradient(
                    context, "Finished Games", true),
                body: gradientComp.backgroundGradient(
                    context, listComponents(context)),
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
                    onTap: (index) {
                      store.setIndex(index);
                    },
                  ),
                ),
                floatingActionButton: store.listOfGames != null
                    ? FloatingActionButton(
                  backgroundColor: Color(0xFF13213b),
                  onPressed: () async {
                    await store.openCrud();
                  },
                  child: Icon(Icons.my_library_add),
                )
                    : null,
              )
          );
        }
    );
  }
}
