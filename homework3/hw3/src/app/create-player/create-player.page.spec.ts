import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CreatePlayerPage } from './create-player.page';

describe('CreatePlayerPage', () => {
  let component: CreatePlayerPage;
  let fixture: ComponentFixture<CreatePlayerPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CreatePlayerPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CreatePlayerPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
