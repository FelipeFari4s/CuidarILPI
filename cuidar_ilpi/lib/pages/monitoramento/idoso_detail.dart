import 'package:flutter/material.dart';

class HealthMonitoringDetailScreen extends StatefulWidget {
  final int id; // Identificador do idoso para passar as informações

  const HealthMonitoringDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _HealthMonitoringDetailScreenState createState() => _HealthMonitoringDetailScreenState();
}

class _HealthMonitoringDetailScreenState extends State<HealthMonitoringDetailScreen> {
  // Dados fictícios para o exemplo
  final Map<String, String> elderlyData = {
    'Nome': 'João da Silva',
    'Data de Nascimento': '15/08/1945',
    'Idade': '78',
    'Sexo': 'M',
    'Religião': 'Católica',
    'Escolaridade': 'Ensino Médio Completo',
    'Ocupação Anterior': 'Professor',
    'Aposentado': 'Sim',
    'Data da Institucionalização': '01/01/2023',
    'Motivo da Institucionalização': 'Cuidados especiais',
    'Possui Familiares': 'Sim',
  };

  final Map<String, bool> comorbidades = {
    'Diabetes': false,
    'Hipertensão': false,
    'Depressão': false,
    'Hipotireoidismo': false,
    'Demência': false,
    'DPOC': false,
    'Doença Renal Crônica': false,
    'Insuficiência Cardíaca': false,
  };
  

  bool? internacaoHospitalar;
  bool? foiEtilista;
  bool? foiTabagista;

  final TextEditingController outrasController = TextEditingController();

  final List<Map<String, dynamic>> medicamentos = [];
  Map<String, dynamic>? selectedMedicamento;

  final List<Map<String, dynamic>> sinaisVitais = [];
  Map<String, dynamic>? selectedSinalVital;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoramento de Saúde'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Identificação da Pessoa Idosa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...elderlyData.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        '${entry.key}:',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(entry.value),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 20),

            const Text(
              'Antecedentes Pessoais',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text('Comorbidades:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Lista de comorbidades
            ...comorbidades.keys.map((key) {
              return CheckboxListTile(
                title: Text(key),
                value: comorbidades[key],
                onChanged: (bool? value) {
                  setState(() {
                    comorbidades[key] = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              );
            }).toList(),

            // Campo para "Outras comorbidades"
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextField(
                controller: outrasController,
                decoration: const InputDecoration(
                  labelText: 'Outras comorbidades',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text('Internação hospitalar nos últimos 6 meses:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Sim'),
                    value: true,
                    groupValue: internacaoHospitalar,
                    onChanged: (value) {
                      setState(() {
                        internacaoHospitalar = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Não'),
                    value: false,
                    groupValue: internacaoHospitalar,
                    onChanged: (value) {
                      setState(() {
                        internacaoHospitalar = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const Text('Já foi etilista:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Sim'),
                    value: true,
                    groupValue: foiEtilista,
                    onChanged: (value) {
                      setState(() {
                        foiEtilista = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Não'),
                    value: false,
                    groupValue: foiEtilista,
                    onChanged: (value) {
                      setState(() {
                        foiEtilista = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const Text('Já foi tabagista:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Sim'),
                    value: true,
                    groupValue: foiTabagista,
                    onChanged: (value) {
                      setState(() {
                        foiTabagista = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Não'),
                    value: false,
                    groupValue: foiTabagista,
                    onChanged: (value) {
                      setState(() {
                        foiTabagista = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              'Medicações do dia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Tabela de Medicações com scroll horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Medicação')),
                  DataColumn(label: Text('Dose')),
                  DataColumn(label: Text('Via')),
                  DataColumn(label: Text('Horários')),
                  DataColumn(label: Text('Checagem')),
                  DataColumn(label: Text('Observação')),
                ],
                rows: medicamentos.map((medicamento) {
                  return DataRow(
                    cells: [
                      DataCell(Text(medicamento['medicacao'])),
                      DataCell(Text(medicamento['dose'])),
                      DataCell(Text(medicamento['via'])),
                      DataCell(Text(medicamento['horarios'])),
                      DataCell(
                        Checkbox(
                          value: medicamento['checagem'],
                          onChanged: (value) {
                            setState(() {
                              medicamento['checagem'] = value;
                            });
                          },
                        ),
                      ),
                      DataCell(
                        TextField(
                          controller: TextEditingController(
                              text: medicamento['observacao']),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              medicamento['observacao'] = value;
                            });
                          },
                        ),
                      ),
                    ],
                    selected: medicamento == selectedMedicamento,
                    onSelectChanged: (selected) {
                      if (selected != null && selected) {
                        setState(() {
                          selectedMedicamento = medicamento;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _showCadastrarDialog(),
                  child: const Text('Cadastrar Medicação'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: selectedMedicamento != null
                      ? () => _showEditarDialog()
                      : null,
                  child: const Text('Editar Medicação'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              'Sinais Vitais do dia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Tabela de Sinais Vitais com scroll horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Temperatura (ºC)')),
                  DataColumn(label: Text('Frequência Cardíaca (bpm)')),
                  DataColumn(label: Text('Respiração (irpm)')),
                  DataColumn(label: Text('Pressão Arterial (mmHg)')),
                ],
                rows: sinaisVitais.map((sinalVital) {
                  return DataRow(
                    cells: [
                      DataCell(Text(sinalVital['temperatura'])),
                      DataCell(Text(sinalVital['frequenciaCardiaca'])),
                      DataCell(Text(sinalVital['respiracao'])),
                      DataCell(Text(sinalVital['pressaoArterial'])),
                    ],
                    selected: sinalVital == selectedSinalVital,
                    onSelectChanged: (selected) {
                      if (selected != null && selected) {
                        setState(() {
                          selectedSinalVital = sinalVital;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _showCadastrarSinaisVitaisDialog(),
                  child: const Text('Cadastrar Sinais Vitais'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: selectedSinalVital != null
                      ? () {
                          setState(() {
                            sinaisVitais.remove(selectedSinalVital);
                            selectedSinalVital = null;
                          });
                        }
                      : null,
                  child: const Text('Excluir Sinais Vitais'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCadastrarDialog() {
    final TextEditingController medicacaoController = TextEditingController();
    final TextEditingController doseController = TextEditingController();
    final TextEditingController viaController = TextEditingController();
    final TextEditingController horariosController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar Medicação'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: medicacaoController,
                decoration: const InputDecoration(labelText: 'Medicação'),
              ),
              TextField(
                controller: doseController,
                decoration: const InputDecoration(labelText: 'Dose'),
              ),
              TextField(
                controller: viaController,
                decoration: const InputDecoration(labelText: 'Via'),
              ),
              TextField(
                controller: horariosController,
                decoration: const InputDecoration(labelText: 'Horários'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  medicamentos.add({
                    'medicacao': medicacaoController.text,
                    'dose': doseController.text,
                    'via': viaController.text,
                    'horarios': horariosController.text,
                    'checagem': false,
                    'observacao': '',
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Cadastrar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _showEditarDialog() {
    final TextEditingController medicacaoController =
        TextEditingController(text: selectedMedicamento?['medicacao']);
    final TextEditingController doseController =
        TextEditingController(text: selectedMedicamento?['dose']);
    final TextEditingController viaController =
        TextEditingController(text: selectedMedicamento?['via']);
    final TextEditingController horariosController =
        TextEditingController(text: selectedMedicamento?['horarios']);
    final TextEditingController observacaoController =
        TextEditingController(text: selectedMedicamento?['observacao']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Medicação'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: medicacaoController,
                decoration: const InputDecoration(labelText: 'Medicação'),
              ),
              TextField(
                controller: doseController,
                decoration: const InputDecoration(labelText: 'Dose'),
              ),
              TextField(
                controller: viaController,
                decoration: const InputDecoration(labelText: 'Via'),
              ),
              TextField(
                controller: horariosController,
                decoration: const InputDecoration(labelText: 'Horários'),
              ),
              TextField(
                controller: observacaoController,
                decoration: const InputDecoration(labelText: 'Observação'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final index = medicamentos.indexOf(selectedMedicamento!);
                  medicamentos[index] = {
                    'medicacao': medicacaoController.text,
                    'dose': doseController.text,
                    'via': viaController.text,
                    'horarios': horariosController.text,
                    'checagem': selectedMedicamento!['checagem'],
                    'observacao': observacaoController.text,
                  };
                  selectedMedicamento = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  medicamentos.remove(selectedMedicamento);
                  selectedMedicamento = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Excluir'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _showCadastrarSinaisVitaisDialog() {
    final TextEditingController temperaturaController = TextEditingController();
    final TextEditingController frequenciaCardiacaController =
        TextEditingController();
    final TextEditingController respiracaoController = TextEditingController();
    final TextEditingController pressaoArterialController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cadastrar Sinais Vitais'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: temperaturaController,
                decoration:
                    const InputDecoration(labelText: 'Temperatura (ºC)'),
              ),
              TextField(
                controller: frequenciaCardiacaController,
                decoration: const InputDecoration(
                    labelText: 'Frequência Cardíaca (bpm)'),
              ),
              TextField(
                controller: respiracaoController,
                decoration:
                    const InputDecoration(labelText: 'Respiração (irpm)'),
              ),
              TextField(
                controller: pressaoArterialController,
                decoration:
                    const InputDecoration(labelText: 'Pressão Arterial (mmHg)'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sinaisVitais.add({
                    'temperatura': temperaturaController.text,
                    'frequenciaCardiaca': frequenciaCardiacaController.text,
                    'respiracao': respiracaoController.text,
                    'pressaoArterial': pressaoArterialController.text,
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Cadastrar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
