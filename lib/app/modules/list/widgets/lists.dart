import 'package:flutter/material.dart';
import 'cards.dart';

Widget showLists(sizeWidth, sizeHeight, listStore) {
  if (listStore.selectedIndex == 0) {
    return listStore.responsePubs.length > 0
        ? Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView.builder(
              itemCount: listStore.responsePubs.length,
              itemBuilder: (context, index) {
                return cardPublisher(listStore.responsePubs[index]);
              }),
        )
        : Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView(
            children: [
              Text("Empty List"),
            ],
          ),
        );
  } else if (listStore.selectedIndex == 1) {
    return listStore.responseGames.length > 0
        ? Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView.builder(
              itemCount: listStore.responseGames.length,
              itemBuilder: (context, index) {
                return cardGame(listStore.responseGames[index], listStore.responsePubs);
              }),
        )
        : Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView(
            children: [
              Text("Empty List"),
            ],
          ),
        );
  } else {
    return listStore.responseRegister.length > 0
        ? Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView.builder(
              itemCount: listStore.responseRegister.length,
              itemBuilder: (context, index) {
                return cardRegister(listStore.responseRegister[index], listStore.responseGames);
              }),
        )
        : Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView(
            children: [
              Text("Empty List"),
            ],
          ),
        );
  }
}

Widget listsWhenFailed(sizeWidth, sizeHeight) {
  return Container(
    alignment: Alignment.center,
    width: sizeWidth / 1.1,
    height: sizeHeight / 1.3,
    child: ListView(
      children: [
        Center(
          child: Text("Error"),
        )
      ],
    ),
  );
}

Widget crudListsWaiting(sizeWidth, sizeHeight) {
  return Center(
    child: CircularProgressIndicator(),
  );
}