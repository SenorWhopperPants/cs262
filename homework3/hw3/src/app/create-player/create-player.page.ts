import { Component, OnInit } from '@angular/core';
import { FirebaseService } from '../services/firebase.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-create-player',
  templateUrl: './create-player.page.html',
  styleUrls: ['./create-player.page.scss'],
})
export class CreatePlayerPage implements OnInit {

  public name: string;
  public email: string;

  public game1: 'game1';
  public game;

  constructor(private firebase: FirebaseService) { }

  ngOnInit() {
    // run and print out the tables' info
    this.game = this.firebase.getGame();
    //this.game.valueChanges();
    //console.log(game);


  }

  addPlayer() {
    if (this.name !== '' && this.email !== '') {
      this.firebase.createPlayer(this.name, this.email);
    }
  }

  showGame() {
    console.log(this.game);
  }

}
