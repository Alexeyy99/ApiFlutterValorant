import 'package:clash/api/search/search_page.dart';
import 'package:clash/controllers/valorant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        shadowColor: Colors.red,
        title: const Text('Agentes'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchPage());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: GetBuilder<ValorantController>(
        builder: (agenteController) {
          return (agenteController.cargando == true)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: agenteController.listAgentes.length,
                  itemBuilder: (context, i) {
                    final agente = agenteController.listAgentes[i];

                    return ListTile(
                      onTap: () {
                        agenteController.agente = agente;
                        Navigator.pushNamed(context, '/detalles/agente');
                      },
                      title: Text(agente.displayName!),
                      leading: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  color: Colors.black,
                                  spreadRadius: 1)
                            ]),
                        child: CircleAvatar(
                          backgroundImage: agente.img != null
                              ? NetworkImage(agente.img!)
                              : const AssetImage('./assets/images/logov.png')
                                  as ImageProvider,
                          backgroundColor: Colors.white,
                          radius: 25,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    );
                  });
        },
      ),
    );
  }
}
