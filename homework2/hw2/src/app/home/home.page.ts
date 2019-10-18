import { Component, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { SettingsService } from '../services/settings.service';


@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(private router: Router, private settings: SettingsService) {
    this.settings.getUserName();
    this.settings.getDarkMode();
    this.settings.getFontSize();
   }

  settingsClick() {
    // set navigation to settings page here
    this.router.navigateByUrl('settings');
  }

}
