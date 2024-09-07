import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/pages/monitoramento/idoso_detail.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({Key? key}) : super(key: key);

  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  String? _selectedEducation;
  String? _institutionalizationDate;
  String? _institutionalizationReason;
  bool _hasFamily = false;
  bool _isAposentado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Monitoramento de Saúde',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cadastrar Pessoa Idosa Residente',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Nome
            Container(
              width: double.infinity, // Define a largura do campo
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Data de Nascimento
            Container(
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Data de Nascimento (DD/MM/AAAA)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            const SizedBox(height: 10),

            // Sexo
            Container(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Sexo',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'F', child: Text('Feminino')),
                  DropdownMenuItem(value: 'M', child: Text('Masculino')),
                  DropdownMenuItem(value: 'Outro', child: Text('Outro')),
                ],
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 10),

            // Religião
            Container(
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Religião',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Escolaridade
            Container(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                value: _selectedEducation,
                decoration: const InputDecoration(
                  labelText: 'Escolaridade',
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Ensino Fundamental Incompleto',
                  'Ensino Fundamental Completo',
                  'Ensino Médio Incompleto',
                  'Ensino Médio Completo',
                  'Ensino Superior Incompleto',
                  'Ensino Superior Completo',
                  'Pós Graduação',
                  'Mestrado',
                  'Doutorado'
                ].map((education) {
                  return DropdownMenuItem<String>(
                    value: education,
                    child: Text(education),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedEducation = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),

            // Ocupação anterior
            Container(
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Ocupação anterior',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Data da institucionalização
            Container(
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Data da Institucionalização (DD/MM/AAAA)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  setState(() {
                    _institutionalizationDate = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),

            // Motivo da institucionalização
            Container(
              width: double.infinity,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Motivo da Institucionalização',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _institutionalizationReason = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),

            // Aposentado
            Row(
              children: [
                const Text(
                  'Aposentado:',
                  style: TextStyle(fontSize: 17),
                ),
                Checkbox(
                  value: _isAposentado,
                  onChanged: (value) {
                    setState(() {
                      _isAposentado = value ?? false;
                    });
                  },
                ),
                const Text('Sim'),
                Checkbox(
                  value: !_isAposentado,
                  onChanged: (value) {
                    setState(() {
                      _isAposentado = !(value ?? false);
                    });
                  },
                ),
                const Text('Não'),
              ],
            ),

            const SizedBox(height: 10),
            // Possui familiares
            Row(
              children: [
                const Text(
                  'Possui Familiares:',
                  style: TextStyle(fontSize: 17),
                ),
                Checkbox(
                  value: _hasFamily,
                  onChanged: (value) {
                    setState(() {
                      _hasFamily = value ?? false;
                    });
                  },
                ),
                const Text('Sim'),
                Checkbox(
                  value: !_hasFamily,
                  onChanged: (value) {
                    setState(() {
                      _hasFamily = !(value ?? false);
                    });
                  },
                ),
                const Text('Não'),
              ],
            ),
            const SizedBox(height: 10),

            // Botão para cadastrar
            ElevatedButton(
              onPressed: () {
                // Lógica para cadastrar idoso
              },
              child: const Text('Cadastrar'),
            ),
            const SizedBox(height: 30),

            const Text(
              'Lista de Pessoas Idosas Residentes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Campo de busca
            Container(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar por nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Exemplo de lista de idosos cadastrados
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Exemplo com 5 itens
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('Idoso ${index + 1}'),
                    subtitle: const Text('Detalhes do residente'),
                    onTap: () {
                      // Navegação para a tela de monitoramento do idoso
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HealthMonitoringDetailScreen(id: index + 1),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
