import { Component } from '@angular/core';
import { InputChangeEventDetail } from '@ionic/core';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  public inputVal1: string;
  public inputVal2: string;
  public result: number;
  public operator: string;
  constructor() {}

  enterBtnClick() {
    // the prefixed + turns the variable into a number
    // const x = +this.inputVal1;
    // const y = +this.inputVal2;
    // this.result = x + y;
    const x = +this.inputVal1;
    const y = +this.inputVal2;

    if (this.operator === '+') {
      this.result = x + y;
    } else if (this.operator === '-') {
      this.result = x - y;
    } else if (this.operator === '*') {
      this.result = x * y;
    } else if (this.operator === '/') {
      this.result = x / y;
    } else {
      this.result = 0;
    }
  }

}
