/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package exercicio2;
import java.util.Scanner;

public class JogoDaVelha {
    private enum Casa {
        VAZIA,
        JOGADOR1,
        JOGADOR2
    }

    private Casa[][] grade;
    private final int TAMANHO = 3;

    public JogoDaVelha() {
        grade = new Casa[TAMANHO][TAMANHO];
        for (int i = 0; i < TAMANHO; i++) {
            for (int j = 0; j < TAMANHO; j++) {
                grade[i][j] = Casa.VAZIA;
            }
        }
    }

    public void exibirGrade() {
        for (int i = 0; i < TAMANHO; i++) {
            for (int j = 0; j < TAMANHO; j++) {
                System.out.print(grade[i][j] == Casa.VAZIA ? "-" : grade[i][j] == Casa.JOGADOR1 ? "X" : "O");
                if (j < TAMANHO - 1) {
                    System.out.print(" | ");
                }
            }
            System.out.println();
            if (i < TAMANHO - 1) {
                System.out.println("---------");
            }
        }
    }

    public void jogar() {
        Scanner scanner = new Scanner(System.in);
        int jogadaX, jogadaY;
        Casa jogadorAtual = Casa.JOGADOR1;

        while (true) {
            System.out.println("Jogador " + (jogadorAtual == Casa.JOGADOR1 ? "1 (X)" : "2 (O)") + ", faça sua jogada (linha coluna): ");
            jogadaX = scanner.nextInt();
            jogadaY = scanner.nextInt();

            if (jogadaValida(jogadaX, jogadaY)) {
                grade[jogadaX][jogadaY] = jogadorAtual;
                exibirGrade();
                if (verificarVitoria(jogadorAtual)) {
                    System.out.println("Jogador " + (jogadorAtual == Casa.JOGADOR1 ? "1 (X)" : "2 (O)") + " venceu!");
                    break;
                } else if (verificarEmpate()) {
                    System.out.println("Empate!");
                    break;
                }
                jogadorAtual = (jogadorAtual == Casa.JOGADOR1) ? Casa.JOGADOR2 : Casa.JOGADOR1;
            } else {
                System.out.println("Jogada inválida. Tente novamente.");
            }
        }
        scanner.close();
    }

    private boolean jogadaValida(int x, int y) {
        return x >= 0 && x < TAMANHO && y >= 0 && y < TAMANHO && grade[x][y] == Casa.VAZIA;
    }

    private boolean verificarVitoria(Casa jogador) {
        // Verifica linhas e colunas
        for (int i = 0; i < TAMANHO; i++) {
            if (grade[i][0] == jogador && grade[i][1] == jogador && grade[i][2] == jogador) {
                return true;
            }
            if (grade[0][i] == jogador && grade[1][i] == jogador && grade[2][i] == jogador) {
                return true;
            }
        }

        // Verifica diagonais
        if (grade[0][0] == jogador && grade[1][1] == jogador && grade[2][2] == jogador) {
            return true;
        }
        if (grade[0][2] == jogador && grade[1][1] == jogador && grade[2][0] == jogador) {
            return true;
        }

        return false;
    }

    private boolean verificarEmpate() {
        for (int i = 0; i < TAMANHO; i++) {
            for (int j = 0; j < TAMANHO; j++) {
                if (grade[i][j] == Casa.VAZIA) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
        JogoDaVelha jogo = new JogoDaVelha();
        jogo.exibirGrade();
        jogo.jogar();
    }
}
