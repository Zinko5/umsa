
import javax.swing.DefaultListModel;
import javax.swing.table.DefaultTableModel;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
/**
 *
 * @author gabriel
 */
public class mostrarUnESFP extends javax.swing.JFrame {

    /**
     * Creates new form mostrarUnESFP
     */
    private DefaultListModel Datos;
    private DefaultTableModel Datos1;
    private DefaultTableModel Datos2;
    private PilaEducacionSuperiorFormacionProfesional pesfp;
    private mostrarESFP mESFP;
    private leerLugarCercano llc;
    private leerRuta lr;
    private mostrarUnaRuta mUnaRuta;
    int n;

    public mostrarUnESFP() {
        initComponents();
    }

    public mostrarUnESFP(PilaEducacionSuperiorFormacionProfesional p, int nro) {
        n = nro;
        pesfp = p;
        initComponents();
        this.setLocationRelativeTo(null);
        EducacionSuperiorFormacionProfesional elem;
        int c;
        Datos = new DefaultListModel();
        lista.setModel(Datos);
        c = 0;
        if (pesfp.esvacia()) {
        } else {
            PilaEducacionSuperiorFormacionProfesional aux = new PilaEducacionSuperiorFormacionProfesional();
            while (!pesfp.esvacia()) {
                elem = pesfp.eliminar();
                aux.adicionar(elem);
                if (c == n) {
                    Datos.addElement(elem.getNombre());
                    Datos.addElement(elem.getTipo());
                    Datos.addElement(elem.getUbicacion());
                }
                c++;
            }
            while (!aux.esvacia()) {
                elem = aux.eliminar();

                pesfp.adicionar(elem);
            }
        }

        pesfp = p;
        EducacionSuperiorFormacionProfesional elem1;
        Datos1 = new DefaultTableModel();
        tablalugares.setModel(Datos1);
        Datos1.addColumn("Nombre");
        Datos1.addColumn("Tipo");
        Datos1.addColumn("Horario Atencion");

        c = 0;
        if (pesfp.esvacia()) {
        } else {
            PilaEducacionSuperiorFormacionProfesional aux1 = new PilaEducacionSuperiorFormacionProfesional();
            while (!pesfp.esvacia()) {
                elem1 = pesfp.eliminar();
                aux1.adicionar(elem1);
                if (c == n) {
                    String vector[] = new String[3];
                    NodoCircularSimpleLugarCercano nodo = elem1.getListaCircularSimplelugaresCercanos().getNodo();
                    while (elem1.getListaCircularSimplelugaresCercanos().getNodo() != null && nodo.getSig() != elem1.getListaCircularSimplelugaresCercanos().getNodo()) {

                        vector[0] = nodo.getObjeto().getNombre();
                        vector[1] = nodo.getObjeto().getTipo();
                        vector[2] = nodo.getObjeto().getHorarioAtencion();
                        Datos1.addRow(vector);
                        nodo = nodo.getSig();
                    }
                    if (elem1.getListaCircularSimplelugaresCercanos().getNodo() != null) {
                        vector[0] = nodo.getObjeto().getNombre();
                        vector[1] = nodo.getObjeto().getTipo();
                        vector[2] = nodo.getObjeto().getHorarioAtencion();
                        Datos1.addRow(vector);
                    }

                }

                c++;
            }
            System.out.println();
            while (!aux1.esvacia()) {
                elem1 = aux1.eliminar();

                pesfp.adicionar(elem1);
            }
        }

        pesfp = p;
        Datos2 = new DefaultTableModel();
        tablarutas.setModel(Datos2);
        Datos2.addColumn("Origen");
        Datos2.addColumn("Destino");
        Datos2.addColumn("Tiempo Estimado (minutos)");

        c = 0;
        if (pesfp.esvacia()) {
        } else {
            PilaEducacionSuperiorFormacionProfesional aux1 = new PilaEducacionSuperiorFormacionProfesional();
            while (!pesfp.esvacia()) {
                elem1 = pesfp.eliminar();
                aux1.adicionar(elem1);
                if (c == n) {
                    String vector[] = new String[3];

                    for (int i = 0; i < elem1.getArrayListRutas().size(); i++) {
                        Ruta objetosacado = elem1.getArrayListRutas().get(i);
                        vector[0] = objetosacado.getOrigen();
                        vector[1] = objetosacado.getDestino();
                        vector[2] = Integer.toString(objetosacado.getTiempoEstimado());
                        Datos2.addRow(vector);
                    }

                }

                c++;
            }
            while (!aux1.esvacia()) {
                elem1 = aux1.eliminar();

                pesfp.adicionar(elem1);
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
        jScrollPane1 = new javax.swing.JScrollPane();
        lista = new javax.swing.JList<>();
        jScrollPane4 = new javax.swing.JScrollPane();
        tablalugares = new javax.swing.JTable();
        jScrollPane5 = new javax.swing.JScrollPane();
        tablarutas = new javax.swing.JTable();
        bvolver = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        bAñadeLugar = new javax.swing.JButton();
        bAñadeRuta = new javax.swing.JButton();
        bExaima = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(204, 255, 204));

        jScrollPane1.setViewportView(lista);

        tablalugares.setModel(new javax.swing.table.DefaultTableModel(
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
        jScrollPane4.setViewportView(tablalugares);

        tablarutas.setModel(new javax.swing.table.DefaultTableModel(
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
        jScrollPane5.setViewportView(tablarutas);

        bvolver.setText("volver");
        bvolver.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bvolverActionPerformed(evt);
            }
        });

        jLabel1.setText("<html>\nLugar de <br>\nEducacion<br>\nSuperior y<br>\nFormacion<br>\nProfesional:\n</html>");

        jLabel2.setText("Lugares Cercanos:");

        jLabel3.setText("Rutas:");

        bAñadeLugar.setText("Añadir Lugar Cercano");
        bAñadeLugar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bAñadeLugarActionPerformed(evt);
            }
        });

        bAñadeRuta.setText("Añadir Ruta");
        bAñadeRuta.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bAñadeRutaActionPerformed(evt);
            }
        });

        bExaima.setText("Examinar");
        bExaima.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                bExaimaActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(60, 60, 60)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(bvolver)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 156, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 148, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 427, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3)
                    .addComponent(bAñadeLugar)
                    .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                            .addComponent(bAñadeRuta, javax.swing.GroupLayout.PREFERRED_SIZE, 174, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(bExaima))
                        .addComponent(jScrollPane5, javax.swing.GroupLayout.PREFERRED_SIZE, 427, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(120, 120, 120))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(18, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 164, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(bAñadeLugar)
                .addGap(23, 23, 23)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane5, javax.swing.GroupLayout.PREFERRED_SIZE, 170, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(bAñadeRuta)
                    .addComponent(bExaima))
                .addGap(17, 17, 17))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(57, 57, 57)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1)
                .addGap(48, 48, 48)
                .addComponent(bvolver)
                .addGap(37, 37, 37))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void bvolverActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bvolverActionPerformed
        // TODO add your handling code here:
        mESFP = new mostrarESFP(pesfp);
        mESFP.setVisible(true);
        this.setVisible(false);
    }//GEN-LAST:event_bvolverActionPerformed

    private void bAñadeLugarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bAñadeLugarActionPerformed
        // TODO add your handling code here:
        llc = new leerLugarCercano(pesfp, n);
        llc.setVisible(true);
        this.setVisible(false);
        
    }//GEN-LAST:event_bAñadeLugarActionPerformed

    private void bAñadeRutaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bAñadeRutaActionPerformed
        // TODO add your handling code here:
        lr = new leerRuta(pesfp, n);
        lr.setVisible(true);
        this.setVisible(false);
    }//GEN-LAST:event_bAñadeRutaActionPerformed

    private void bExaimaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_bExaimaActionPerformed
        // TODO add your handling code here:
        int select = tablarutas.getSelectedRow();
        if (select != -1) {
            mUnaRuta = new mostrarUnaRuta(pesfp, n, select);
            mUnaRuta.setVisible(true);
            this.setVisible(false);
        }
    }//GEN-LAST:event_bExaimaActionPerformed

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
            java.util.logging.Logger.getLogger(mostrarUnESFP.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(mostrarUnESFP.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(mostrarUnESFP.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(mostrarUnESFP.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new mostrarUnESFP().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton bAñadeLugar;
    private javax.swing.JButton bAñadeRuta;
    private javax.swing.JButton bExaima;
    private javax.swing.JButton bvolver;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JList<String> lista;
    private javax.swing.JTable tablalugares;
    private javax.swing.JTable tablarutas;
    // End of variables declaration//GEN-END:variables
}
