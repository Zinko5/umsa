import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup } from '@angular/forms';

enum Suscripcion {
  Basica = 'Basica',
  Premium = 'Premium',
  Avanzada = 'Avanzada',
}

@Component({
  selector: 'app-reactive-form',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './reactive-form.component.html',
  styleUrl: './reactive-form.component.css'
})
export class ReactiveFormComponent {
  constructor(private formBuilder: FormBuilder) {

  }

  registerForm = this.formBuilder.group({
    username: [''],
    password: [''],
    suscripcion: [Suscripcion.Basica],
    promociones: [true],
  });

  refrescar() {
    this.registerForm.patchValue({
      username: '',
      password: '',
      suscripcion: Suscripcion.Basica,
      promociones: true,
    });
  }

  suscripciones: any[] = [];

  /*ngOnInit() {
    for (let item in Suscripcion) {
      if (isNaN(Number(item))) {
        this.suscripciones.push({ text: item as SuscripcionIndex, value: Suscripcion[item as SuscripcionIndex] });
      }
      
    }
  }*/

  submit() {
    console.log(this.registerForm.value);
    this.mostrarNotificacion();
  }

  mostrarNotificacion() {
    alert('Formulario Enviado');
  }


}