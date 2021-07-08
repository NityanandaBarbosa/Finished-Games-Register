import 'package:flutter/material.dart';
import 'cards.dart';

Widget showLists(sizeWidth, sizeHeight, listStore) {
  if (listStore.selectedIndex == 0) {
    return listStore.listOfPublishers.length > 0
        ? Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView.builder(
              itemCount: listStore.listOfPublishers.length,
              itemBuilder: (context, index) {
                return cardPublisher(listStore.listOfPublishers[index]);
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
    return listStore.listOfGames.length > 0
        ? Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView.builder(
              itemCount: listStore.listOfGames.length,
              itemBuilder: (context, index) {
                return cardGame(listStore.listOfGames[index], listStore.listOfPublishers);
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
    return listStore.listOfRegisters.length > 0
        ? Container(
          width: sizeWidth / 1.1,
          height: sizeHeight / 1.3,
          child: ListView.builder(
              itemCount: listStore.listOfRegisters.length,
              itemBuilder: (context, index) {
                return cardRegister(listStore.listOfRegisters[index], listStore.listOfGames);
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