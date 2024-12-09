import 'dart:math';

String calcularResultado(String op1, String op2, String operacao) {
  double num1 = double.parse(op1);
  double num2 = double.parse(op2);
  double resultado;

  switch (operacao) {
    case "+":
      resultado = num1 + num2;
      break;
    case "-":
      resultado = num1 - num2;
      break;
    case "×":
      resultado = num1 * num2;
      break;
    case "÷":
      if (num2 == 0) return "Erro"; // Evitar divisão por zero
      resultado = num1 / num2;
      break;
    case "^":
      resultado = pow(num1, num2).toDouble(); // Certifique-se de converter para double
      break;
    case "√":
      if (num1 < 0) return "Erro"; // Evitar raiz de número negativo
      resultado = sqrt(num1);
      break;
    default:
      return "Erro";
  }

  return resultado.toStringAsFixed(2); // Formata com 2 casas decimais
}
