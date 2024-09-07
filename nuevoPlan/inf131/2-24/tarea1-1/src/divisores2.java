import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class divisores2 {

    public static void main(String[] args) {
        JFrame frame = new JFrame("Calculadora de Divisores Optimizada");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(null); 

        JTextField textField = new JTextField();
        textField.setBounds(50, 20, 150, 30);
        frame.add(textField);

        JButton calcularButton = new JButton("Calcular Divisores");
        calcularButton.setBounds(220, 20, 150, 30);
        frame.add(calcularButton);

        JTextArea resultadoArea = new JTextArea();
        resultadoArea.setEditable(false); 

        JScrollPane scrollPane = new JScrollPane(resultadoArea);
        scrollPane.setBounds(50, 70, 320, 170);
        frame.add(scrollPane);

        calcularButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String input = textField.getText();

                try {
                    long numero = Long.parseLong(input);
                    resultadoArea.setText("Los divisores de " + numero + " son:\n");

                    for (long i = 1; i * i <= numero; i++) {
                        if (numero % i == 0) {
                            resultadoArea.append(i + "\n");
                            if (i != numero / i) { 
                                resultadoArea.append((numero / i) + "\n"); 
                            }
                        }
                    }
                } catch (NumberFormatException ex) {
                    resultadoArea.setText("Por favor, ingrese un número válido.");
                }
            }
        });

        frame.setVisible(true);
    }
}
