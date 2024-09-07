import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class componerizq {

    public static void main(String[] args) {
        JFrame frame = new JFrame("Descomposición y Composición por Izquierda");
        frame.setSize(400, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(null);

        JTextField textField = new JTextField();
        textField.setBounds(50, 20, 150, 30);
        frame.add(textField);

        JButton calcularButton = new JButton("Componer");
        calcularButton.setBounds(220, 20, 150, 30);
        frame.add(calcularButton);

        JTextArea resultadoArea = new JTextArea();
        resultadoArea.setEditable(false);

        JScrollPane scrollPane = new JScrollPane(resultadoArea);
        scrollPane.setBounds(50, 70, 320, 270);
        frame.add(scrollPane);

        calcularButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                long numero = Long.parseLong(textField.getText());
                resultadoArea.setText("Descomposición por izquierda:\n");

                String numeroStr = Long.toString(numero);
                for (int i = 0; i < numeroStr.length(); i++) {
                    resultadoArea.append(numeroStr.substring(i) + "\n");
                }

                resultadoArea.append("\nComposición por izquierda:\n");

                long compuesto = 0;
                for (int i = numeroStr.length() - 1; i >= 0; i--) {
                    compuesto = compuesto + Character.getNumericValue(numeroStr.charAt(i)) * (long) Math.pow(10, numeroStr.length() - 1 - i);
                    resultadoArea.append(compuesto + "\n");
                }
            }
        });

        frame.setVisible(true);
    }
}
