/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

import javax.swing.DefaultListModel;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author gabriel
 */
public class mostrarUnaRuta extends javax.swing.JFrame {

    /**
     * Creates new form mostrarUnaRuta
     */
    public mostrarUnaRuta() {
        initComponents();
    }

    PilaEducacionSuperiorFormacionProfesional pesfp;
    private DefaultListModel Datos;
    private DefaultTableModel Datos1;
    private mostrarUnESFP mostrarESFP;
    private int n;
    private int n1;

    public mostrarUnaRuta(PilaEducacionSuperiorFormacionProfesional p, int nro, int nro1) {
        pesfp = p;
        n = nro;
        n1 = nro1;
        initComponents();
        this.setLocationRelativeTo(null);
        Datos = new DefaultListModel();
        lista.setModel(Datos);
        EducacionSuperiorFormacionProfesional elem;
        int c, c1;
        c = 0;
        c1 = 0;
        if (pesfp.esvacia()) {
        } else {
            PilaEducacionSuperiorFormacionProfesional aux = new PilaEducacionSuperiorFormacionProfesional();
            while (!pesfp.esvacia()) {
                elem = pesfp.eliminar();
                aux.adicionar(elem);
                if (c == n) {

                    for (int i = 0; i < elem.getArrayListRutas().size(); i++) {
                        if (c1 == n1) {
                            Ruta objetosacado = elem.getArrayListRutas().get(i);
                            Datos.addElement(objetosacado.getOrigen());
                            Datos.addElement(objetosacado.getDestino());
                            Datos.addElement(objetosacado.getTiempoEstimado());
                        }
                        c1++;

                    }

                }
                c++;
            }
            while (!aux.esvacia()) {
                elem = aux.eliminar();

                pesfp.adicionar(elem);
            }
        }

        Datos1 = new DefaultTableModel();
        tabla.setModel(Datos1);
        Datos1.addColumn("Tipo");
        Datos1.addColumn("Placa");
        Datos1.addColumn("Costo");
        c = 0;
        c1 = 0;
        if (pesfp.esvacia()) {
        } else {
            PilaEducacionSuperiorFormacionProfesional aux = new PilaEducacionSuperiorFormacionProfesional();
            while (!pesfp.esvacia()) {
                elem = pesfp.eliminar();
                aux.adicionar(elem);
                if (c == n) {

                    for (int i = 0; i < elem.getArrayListRutas().size(); i++) {
                        if (c1 == n1) {

                            String vector[] = new String[3];

                            NodoDobleTransporte nodo = elem.getArrayListRutas().get(n1).getListaDobleTransporte().getNodo();
                            while (nodo != null) {
                                vector [0] = elem.getArrayListRutas().get(n1).getListaDobleTransporte().getNodo().getObjeto().getTipoVehiculo();
                                vector [1] = elem.getArrayListRutas().get(n1).getListaDobleTransporte().getNodo().getObjeto().getPlaca();
                                vector [2] = Double.toString(elem.getArrayListRutas().get(n1).getListaDobleTransporte().getNodo().getObjeto().getCosto());
                                Datos1.addRow(vector);//si el "objeto" no es un objeto creado, reemplazar aqui con mostrando los atributos del "objeto"
                                nodo = nodo.getSig();
                            }

                        }
                        c1++;

                    }

                }
                c++;
            }
            while (!aux.esvacia()) {
                elem = aux.eliminar();

                pesfp.adicionar(elem);
            }
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        lista = new javax.swing.JList<>();
        bvolver = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane4 = new javax.swing.JScrollPane();
        tabla = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(204, 255, 204));

        jLabel1.setText("Ruta:");

        jScrollPane1.setViewportView(lista);

        bvolver.setText("volver");
        bvolver.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bvolverActionPerformed(evt);
            }
        });

        jLabel2.setText("Transporte:");

        tabla.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane4.setViewportView(tabla);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(73, 73, 73)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 156, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 90, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 396, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2))
                        .addGap(0, 85, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(bvolver)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(92, 92, 92)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 250, Short.MAX_VALUE)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 45, Short.MAX_VALUE)
                .addComponent(bvolver)
                .addGap(47, 47, 47))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void bvolverActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bvolverActionPerformed
        // TODO add your handling code here:
        mostrarESFP = new mostrarUnESFP(pesfp, n);
        mostrarESFP.setVisible(true);
        this.setVisible(false);
    }//GEN-LAST:event_bvolverActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(mostrarUnaRuta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(mostrarUnaRuta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(mostrarUnaRuta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(mostrarUnaRuta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new mostrarUnaRuta().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton bvolver;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JList<String> lista;
    private javax.swing.JTable tabla;
    // End of variables declaration//GEN-END:variables
}