import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class descomponerder {

    public static void main(String[] args) {
        JFrame frame = new JFrame("Descomposición por Derecha");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(null);

        JTextField textField = new JTextField();
        textField.setBounds(50, 20, 150, 30);
        frame.add(textField);

        JButton calcularButton = new JButton("Descomponer");
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
                long numero = Long.parseLong(textField.getText());
                resultadoArea.setText("Descomposición por Derecha:\n");

                long divisor = 10;
                while (numero > 0) {
                    resultadoArea.append(numero + "\n");
                    numero /= 10;
                }
            }
        });

        frame.setVisible(true);
    }
}
