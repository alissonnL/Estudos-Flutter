import 'dart:io';
import 'dart:math';

/*Faça um programa que calcule e mostre o volume de uma esfera
sendo fornecido o valor de seu raio (R). A fórmula para calcular
o volume é: (4/3) * pi * R3. Considere (atribua) para pi o valor 3.14159.*/

void main()
{
    calcVolume(double.parse(stdin.readLineSync()!));
}

void calcVolume(double raio){
    double pi = 3.14159;

    print("VOLUME = ${(4/3 * pi * pow(raio, 3)).toStringAsFixed(3)}");
}
