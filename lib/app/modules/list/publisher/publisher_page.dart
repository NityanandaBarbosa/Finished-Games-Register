import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:finished_games_register/app/styles/system_pop_ups.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:finished_games_register/app/modules/list/publisher/publisher_store.dart';
import 'package:flutter/material.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
    as gradientComp;

class PublisherPage extends StatefulWidget {
  final String title;
  const PublisherPage({key, this.title = 'PublisherPage'}) : super(key: key);
  @override
  PublisherPageState createState() => PublisherPageState();
}

class PublisherPageState extends ModularState<PublisherPage, PublisherStore> {
  final PublisherStore store = Modular.get<PublisherStore>();

  final _formKey = GlobalKey<FormState>();

  PublisherModel publisher = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    if(publisher != null) {
      store.setPub(publisher);
      store.setPubValues();
    }

    Widget publisherPage(context) {
      return Container(
        alignment: Alignment.topCenter,
        child: Form(
          key: _formKey,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                child: Text(
                  "Name : ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "*",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: TextFormField(
                  initialValue: store.publisherName != null ? store.publisherName : null,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Fill in the field';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Publisher Name",
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 13, color: Colors.black54),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black54)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.business_sharp),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      store.publisherName = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10.0, top: 10, right: 5, bottom: 10),
                child: Text(
                  "Founding Date : ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "*",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: TextFormField(
                  validator: (value) {
                    if (store.foundingDate == null ||
                        store.foundingDate == "") {
                      return 'Fill in the field';
                    }
                    return null;
                  },
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100))
                        .then((date) {
                      if (date != null && date != store.foundingDate) {
                        setState(() {
                          store.foundingDate = date;
                        });
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: (store.foundingDate == null
                        ? "-"
                        : '${store.foundingDate.day}/${store.foundingDate.month}/${store.foundingDate.year}'),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.black),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black54)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.date_range_outlined),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10.0, top: 10, right: 5, bottom: 10),
                child: Text(
                  "Closed Date : ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100))
                        .then((date) {
                      if (date != null && date != store.closedDate) {
                        setState(() {
                          store.closedDate = date;
                        });
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: (store.closedDate == null
                        ? "-"
                        : '${store.closedDate.day}/${store.closedDate.month}/${store.closedDate.year}'),
                    labelStyle: TextStyle(fontSize: 13, color: Colors.black),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black54)),
                    suffixIcon:
                        IconButton(icon: Icon(Icons.date_range_outlined)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: gradientComp.appBarGradient(context, "Publisher Page"),
      body: gradientComp.backgroundGradient(context, publisherPage(context)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          if (_formKey.currentState.validate()) {}
          var responseSave = await store.savePublisher();
          print("RESPONSE ${responseSave}");
          if (responseSave == false) {
            return ShowAlertDialog(context, 'Fill the required fields!');
          } else if (responseSave == null) {
            return ShowAlertDialog(context, 'Could not connect to server!');
          } else {
            store.response == null ? CircularProgressIndicator() : null;
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/lists', ModalRoute.withName('/'));
          }
        },
        child: Icon(Icons.save_rounded),
      ),
    );
  }
}
