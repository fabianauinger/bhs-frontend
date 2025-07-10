import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';

// ENV laden, bevor die App startet
fetch('./assets/env.json')
  .then((response) => response.json())
  .then((env) => {
    // In globale Variable speichern
    (window as any)['APP_ENV'] = env.envName;

    // Jetzt App starten
    return bootstrapApplication(AppComponent, appConfig);
  })
  .catch((err) => {
    console.error('Fehler beim Laden von env.json:', err);
    // App trotzdem starten, aber mit Fallback
    (window as any)['APP_ENV'] = 'UNKNOWN';
    return bootstrapApplication(AppComponent, appConfig);
  });
