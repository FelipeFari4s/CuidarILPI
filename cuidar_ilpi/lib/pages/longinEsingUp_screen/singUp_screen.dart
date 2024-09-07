
import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/pages/longinEsingUp_screen/widgets/custom_button.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  String? _selectedGender;
  String? _selectedCategory;
  int _experienceYears = 0;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Controllers para os campos de texto
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    InputDecoration inputDecoration(String hint, IconData icon,
        {bool isPassword = false, bool isConfirmPassword = false}) {
      return InputDecoration(
        fillColor: const Color.fromARGB(255, 240, 240, 240),
        filled: true,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey[600],
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : isConfirmPassword
                ? IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  )
                : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.0001),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  "Vamos começar!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Registre-se e faça parte da nossa comunidade",
                  style: TextStyle(
                    color: Color.fromARGB(255, 48, 46, 46),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: inputDecoration("Nome do Usuário", Icons.person),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration("Email", Icons.email),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: inputDecoration("Telefone", Icons.phone),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              decoration:
                  inputDecoration("Senha", Icons.lock, isPassword: true),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: inputDecoration("Confirme a Senha", Icons.lock,
                  isConfirmPassword: true),
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              decoration: inputDecoration("Sexo", Icons.wc),
              value: _selectedGender,
              items: ["Masculino", "Feminino"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
            ),
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              decoration: inputDecoration("Categoria Profissional", Icons.work),
              value: _selectedCategory,
              items: [
                "Cuidador(a) de Idosos",
                "Técnico(a) de Enfermagem",
                "Enfermeiro(a)"
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
            ),
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tempo de Experiência (em anos)",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                Slider(
                  value: _experienceYears.toDouble(),
                  min: 0,
                  max: 60,
                  divisions: 60,
                  label: _experienceYears.toString(),
                  onChanged: (double value) {
                    setState(() {
                      _experienceYears = value.round();
                    });
                  },
                ),
                Text(
                  "${_experienceYears} anos",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
          Container(
            height: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.2),
              child: CustomButton(
                color: const Color.fromARGB(255, 0, 0, 0),
                text: "Continuar",
                onPressed: () {
                  print('ok');// ação ao clicar no botão
                },
              ),
            ),
          ),
          SizedBox(height: height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Já tem conta ?"),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/login');
                },
                child: const Text(
                  " Entrar ",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
