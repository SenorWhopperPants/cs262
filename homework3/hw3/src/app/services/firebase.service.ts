import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class FirebaseService {

  public game = 'game1';
  private snapshotChangesSubscription;

  constructor(public afs: AngularFirestore) { }

  // create a new player in the database
  createPlayer(playerName: string, playerEmail: string) {
    return new Promise<any>((resolve, reject) => {
      this.afs.collection('players').add({
        name: playerName,
        email: playerEmail,
      })
      .then(
        res => resolve(res),
        err => reject(err)
      );
    });
  }

  // get data from the database about the game
  getGame(): Observable<any> {
    // return new Promise<any>((resolve, reject) => {
      return this.afs.collection('playerGame').valueChanges();//.doc(this.game).collection('players').valueChanges();
      //return this.afs.collection('players').valueChanges();
      //resolve(this.snapshotChangesSubscription);
      //this.afs.collection('playerGame').doc(this.game);
      //});
  }
}
