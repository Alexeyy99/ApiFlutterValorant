import 'package:clash/controllers/valorant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends SearchDelegate {
  var find = Get.find<ValorantController>();
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () => query = '',
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future.delayed(Duration.zero, () {
      find.buscarAgentes(query);
    });
    // TODO: implement buildSuggestions
    return GetBuilder<ValorantController>(builder: (agenteController) {
      return (query != '')
          ? ListView.builder(
              itemCount: agenteController.agentesSearch.length,
              itemBuilder: (context, i) {
                final agente = agenteController.agentesSearch[i];
                return ListTile(
                  onTap: () {
                    agenteController.agente = agente;
                    Navigator.pushNamed(context, '/detalles/agente');
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(agente.img!),
                  ),
                  title: Text(agente.displayName!),
                );
              })
          : Container(
              padding: const EdgeInsets.all(0),
              width: 500,
              height: 50,
              color: Colors.blue,
              child: const Text(
                '....',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
            );
    });
  }
}
