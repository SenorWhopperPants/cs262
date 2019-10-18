import { Component, OnInit } from '@angular/core';
import { Storage } from '@ionic/storage';
import { SettingsService } from '../services/settings.service';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.page.html',
  styleUrls: ['./settings.page.scss'],
})
export class SettingsPage implements OnInit {

  public userName: string;
  public darkMode: boolean;
  public fontSize: string;

  constructor(private storage: Storage, private settings: SettingsService) {
    this.settings.getUserName();
    this.settings.getDarkMode();
    this.settings.getFontSize();
  }

  ngOnInit() {
  }

  settingsButtonClicked() {
    this.settings.saveUserName(this.userName);
  }

  darkModeToggle() {
    this.settings.saveDarkMode(this.darkMode);
  }

}
